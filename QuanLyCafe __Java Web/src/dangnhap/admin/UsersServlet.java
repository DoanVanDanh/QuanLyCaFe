package dangnhap.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.bind.CycleRecoverable.Context;

import dangnhap.business.User;
import dangnhap.data.UserDB;

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/CheckTaiKhoan")
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HttpSession session2 = request.getSession();
        String url = "/index.jsp";
        
        // get current action
        String action = request.getParameter("checkadmin");
     
//        PrintWriter out2 = response.getWriter();
//		out2.println("<p>"+action+"aaaaaaaaa"+"</p>");
//        

		//gán action đường dẫn mặc định, k có fail, vì nó mặc định lần đầu =null~~
		if(action==null)
			action ="login";
		
        if(action.equals("login"))
        {
        	String username = request.getParameter("nameadmin");
        	String password = request.getParameter("passadmin");
        	User user = new User(username,password);

        	
        	
        	
        	if(UserDB.isAdmin(user)){
        		url=getServletContext().getServletContextName();
        		response.sendRedirect("/"+url+"/QuanLyBan.jsp");
        		System.out.println(url);
        	
        		//set session user--> kiểm tra đó có phải user hay k
        		session.setAttribute("userAdmin", user);
        	}
        	else
        	{
//        		PrintWriter out = response.getWriter();
//        		out.println("<p>Sai username hoặc password</p>");
        	}
        }
        
//        getServletContext()
//        .getRequestDispatcher(url);
//        .forward(request, response);
        
        
        
        
	}

	 @Override
	    protected void doGet(HttpServletRequest request,
	            HttpServletResponse response)
	            throws ServletException, IOException {
	        doPost(request, response);
	    }    
}
	