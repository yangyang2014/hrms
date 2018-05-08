package com.hrms.test;

import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

public class Test {

	
	public void testGenerateRandomNum() {
		Random rand = new Random();
		Set questionIds = new TreeSet();
		while (questionIds.size() < 6) {
			questionIds.add(rand.nextInt(10));
		}
		System.out.println(questionIds.toString());
		System.out.println(questionIds.toArray());
	}
	public static void main(String[] args) {
		
	}

}
