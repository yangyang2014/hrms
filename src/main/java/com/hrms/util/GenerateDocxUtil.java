package com.hrms.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.bind.JAXBElement;

import org.apache.commons.lang3.StringUtils;
import org.docx4j.XmlUtils;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.wml.ContentAccessor;
import org.docx4j.wml.P;
import org.docx4j.wml.Text;

import com.hrms.bean.Msg;
import com.hrms.bean.Recruitment;

/**
 * generate docx file
 * 
 * @author young
 *
 */
public class GenerateDocxUtil {
	public static void main(String[] args) throws Docx4JException, IOException, ParseException {
//		GenerateDocxUtil g = new GenerateDocxUtil();
//		Recruitment a = new Recruitment("寻找不一样的你", null, new Date(), "鹤秦楼", "为了公司发展", "软件开发工程师2名  售后人员10名  财务人员1名");
//		g.generateRecruimentDocx("E:\\code\\templateDOC\\recruitmentInfo.docx",
//		"E:\\code\\templateDOC\\"+"寻找11"+".docx",a);
//		System.out.println("处理成功！！！");
	}
	/**
	 * to generate docx with replacing template placeholder
	 * 
	 * @param templateFileName
	 * @param outputFileName
	 * @param alterString
	 * @return operation status
	 * @throws Docx4JException
	 * @throws IOException
	 * @throws ParseException 
	 */
	public static Msg generateRecruimentDocx(String templateFileName, String outputFileName,Recruitment recruitment)
			throws Docx4JException, IOException, ParseException {
		System.out.println("进入工具中...");
		System.out.println("time="+recruitment);
		GenerateDocxUtil doc = new GenerateDocxUtil();
		WordprocessingMLPackage template = doc.getTemplate(templateFileName);
		//doc.replacePlaceholder(template,"address", alterString);
		// String toAdd = "jos\ndirksen";"E:\\code\\templateDOC\\recruitmentInfo.docx"
		doc.replaceParagraph("name", recruitment.getName().toString(), template,
				 template.getMainDocumentPart());
		doc.replaceParagraph("time",commonUtil.dateToString(recruitment.getTime()).getExtend().get("time").toString(), template,
				 template.getMainDocumentPart());
		doc.replaceParagraph("address", recruitment.getDestination(), template,
				 template.getMainDocumentPart());
		doc.replaceParagraph("employeeinneed", recruitment.getEmployeeinneed(), template,
				 template.getMainDocumentPart());
		System.out.println(doc.toString());
		doc.writeDocxToStream(template, outputFileName);
		return Msg.success();
	}

	/**
	 * docx4j将这个文档加载
	 * 
	 * @author young
	 * @param fileName
	 *            the name of file
	 * @return the docx file in OpenXML format
	 * @throws Docx4JException
	 * @throws FileNotFoundException
	 */
	private WordprocessingMLPackage getTemplate(String fileName) throws Docx4JException, FileNotFoundException {
		WordprocessingMLPackage template = WordprocessingMLPackage.load(new FileInputStream(new File(fileName)));
		return template;
	}

	/**
	 * 允许你针对一个特定的类来搜索指定元素以及它所有的孩子，例如，你可以用它获取文档中所有的表格、表格中所有的行以及其它类似的操作
	 * 
	 * @author young
	 * @param obj
	 * 
	 * @param toSearch
	 * @return
	 */
	private static List<Object> getAllElementFromObject(Object obj, Class<?> toSearch) {
		List<Object> result = new ArrayList<Object>();
		if (obj instanceof JAXBElement)
			obj = ((JAXBElement<?>) obj).getValue();

		if (obj.getClass().equals(toSearch))
			result.add(obj);
		else if (obj instanceof ContentAccessor) {
			List<?> children = ((ContentAccessor) obj).getContent();
			for (Object child : children) {
				result.addAll(getAllElementFromObject(child, toSearch));
			}

		}
		return result;
	}

	/**
	 * @param template
	 * @param name
	 * @param placeholder
	 */
	private void replacePlaceholder(WordprocessingMLPackage template, String name, String placeholder) {
		List<Object> texts = getAllElementFromObject(template.getMainDocumentPart(), Text.class);

		for (Object text : texts) {
			Text textElement = (Text) text;
			if (textElement.getValue().equals(placeholder)) {
				textElement.setValue(name);
			}
		}
	}

	/**
	 * @param template
	 * @param target
	 * @throws IOException
	 * @throws Docx4JException
	 */
	private void writeDocxToStream(WordprocessingMLPackage template, String target)
			throws IOException, Docx4JException {
		File f = new File(target);
		template.save(f);
	}

	/**
	 * @param placeholder
	 * @param textToAdd
	 * @param template
	 * @param addTo
	 */
	private void replaceParagraph(String placeholder, String textToAdd, WordprocessingMLPackage template,
			ContentAccessor addTo) {
		// 1. get the paragraph
		List<Object> paragraphs = getAllElementFromObject(template.getMainDocumentPart(), P.class);

		P toReplace = null;
		for (Object p : paragraphs) {
			List<Object> texts = getAllElementFromObject(p, Text.class);
			for (Object t : texts) {
				Text content = (Text) t;
				if (content.getValue().equals(placeholder)) {
					toReplace = (P) p;
					break;
				}
			}
		}

		// we now have the paragraph that contains our placeholder: toReplace
		// 2. split into seperate lines
		String as[] = StringUtils.splitPreserveAllTokens(textToAdd, '\n');

		for (int i = 0; i < as.length; i++) {
			String ptext = as[i];

			// 3. copy the found paragraph to keep styling correct
			P copy = (P) XmlUtils.deepCopy(toReplace);

			// replace the text elements from the copy
			List<?> texts = getAllElementFromObject(copy, Text.class);
			if (texts.size() > 0) {
				Text textToReplace = (Text) texts.get(1);
				textToReplace.setValue(ptext);
			}

			// add the paragraph to the document
			addTo.getContent().add(copy);
		}

		// 4. remove the original one
		((ContentAccessor) toReplace.getParent()).getContent().remove(toReplace);

	}
}
