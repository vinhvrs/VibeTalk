<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <title>SELECT Operation</title>
   </head>

   <body>
      <sql:setDataSource var = "test" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/TEST"/>
 
      <sql:query dataSource = "${test}" var = "result">
         SELECT * from test_table;
      </sql:query>
 
      <table border = "1" width = "100%">
         <tr>
            <th>first column</th>
            <th>second column</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.fi_col}"/></td>
               <td><c:out value = "${row.se_col}"/></td>
            </tr>
         </c:forEach>
      </table>
 
   </body>
</html>