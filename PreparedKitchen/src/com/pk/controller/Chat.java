package com.pk.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pk.biz.ChatBiz;

@WebServlet("/chat")
public class Chat extends HttpServlet {
	private ChatBiz biz = new ChatBiz();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; UTF-8");
		
		String command = request.getParameter("command");
		String role = request.getParameter("role");
		
		if(command.equals("join")) {
			if(role.equals("ADMIN")) {
				biz.joinAdmin();
				
			}else if(role.equals("USER")) {
				biz.joinUser();
			}
		}else if(command.equals("out")) {
			if(role.equals("ADMIN")) {
				biz.outAdmin();
				
			}else if(role.equals("USER")) {
				biz.outUser();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
