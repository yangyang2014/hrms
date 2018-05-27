package com.hrms.util;

public class constant {
	public static String username = "";//系统当前登录的用户
	public enum Role{
		Sys_Admin(1,"系统管理员"),Admin(2,"人事管理员"),User(3,"普通用户");
		private int index;
		private String role;
		private Role(int index,String role) {
			this.index=index;
			this.role=role;
			
		}
		public static String gerRole(int index) {
			for(Role role:Role.values()) {
				if(role.getIndex()==index) {
					return role.getRole();
				}
			}
			return null;
			
		}
		public int getIndex() {
			return index;
		}
		public void setIndex(int index) {
			this.index = index;
		}
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
	}
	 
}
