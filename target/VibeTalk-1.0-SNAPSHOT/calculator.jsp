<!DOCTYPE>
<html>
<head>
    <title>Calculator</title>
    <meta charset="utf-8">
    <% 
        String firstNumber = request.getParameter("num1");
        if (firstNumber == null){
            firstNumber = "0";
        }
        String secondNumber = request.getParameter("num2");
        if (secondNumber == null){
            secondNumber = "0";
        }
        String operation = request.getParameter("operation");
        double result = 0;
        if (operation != null){
            if (operation.equals("add")){
                result = Double.parseDouble(firstNumber) + Double.parseDouble(secondNumber);
            }
            else if (operation.equals("sub")){
                result = Double.parseDouble(firstNumber) - Double.parseDouble(secondNumber);
            }
            else if (operation.equals("mul")){
                result = Double.parseDouble(firstNumber) * Double.parseDouble(secondNumber);
            }
            else if (operation.equals("div")){
                result = Double.parseDouble(firstNumber) / Double.parseDouble(secondNumber);
            }
        }
    %>

</head>
<body>
    <form action="" method="POST">
        <table>
            <tr>
                <td>First Number:</td>
                <td><input type="text" name="num1"></td>
            </tr>
            <tr>
                <td>Second Number:</td>
                <td><input type="text" name="num2"></td>
            </tr>
            <tr>
                <td>Operation:</td>
                <td>
                    <select name="operation">
                        <option value="add">Add</option>
                        <option value="sub">Subtract</option>
                        <option value="mul">Multiply</option>
                        <option value="div">Divide</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" name="submit" value="Result"></td>
                <td> <%= result %> </td>
            </tr>
        </table>
    </form>
</body>
</html>