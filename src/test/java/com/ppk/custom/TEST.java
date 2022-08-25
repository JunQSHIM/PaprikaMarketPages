package com.ppk.custom;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class TEST {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {

		try (Connection con = DriverManager.getConnection("jdbc:mysql://paprika.c3y7hfipeyzf.ap-northeast-2.rds.amazonaws.com:3306/paprika?serverTimezone=Asia/Seoul", "root", "alcls225")) {
			System.out.println(con);
			System.out.println("�����Ϸ�");
		} catch (Exception e) {
			fail(e.getMessage());
		}

	}
}
