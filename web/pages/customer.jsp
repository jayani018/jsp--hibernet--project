<%--<%@ page import="lk.ijse.jsp.dto.CustomerDTO" %>--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lk.ijse.hibernet.entity.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--    http:://localhost:8080/pos_one/pages/test-customer.jsp-->
    <!--    http:://localhost:8080/pos_one/pages/customer-->

    <!--    http:://localhost:8080/pos_one/pages/customer-->
    <meta charset="UTF-8">
    <title>Customer Manage</title>
    <meta content="width=device-width initial-scale=1" name="viewport">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/styles.css" rel="stylesheet">
    <link crossorigin="anonymous" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" rel="stylesheet">
    <style>
        ul > li {
            cursor: pointer;
        }
    </style>
</head>
<body>
<%--<%--%>
<%--response.sendRedirect("customer");--%>
<%--%>--%>
<!--header-->
<%--<header class="jumbotron bg-primary text-white p-3">--%>
<%--    <h1 class="position-absolute" id="nav"></h1>--%>
<%--    <ul class="list-group list-group-horizontal text-danger justify-content-end font-weight-bold">--%>
<%--        <li class="list-group-item bg-white" id="lnkHome"><a href="../index.jsp">Home</a></li>--%>
<%--        <li class="list-group-item bg-danger text-white" id="lnkCustomer"><a class="text-white" href="http://localhost:8080/jsp/pages/customer">Customer</a>--%>
<%--        </li>--%>
<%--        <li class="list-group-item bg-white" id="lnkItem"><a href="http://localhost:8080/jsp/pages/item">Item</a></li>--%>
<%--        <li class="list-group-item bg-white" id="lnkOrders"><a href="purchase-order.jsp">Orders</a></li>--%>
<%--    </ul>--%>
<%--</header>--%>

<!--customer content-->
<main class="container-fluid" id="customerContent">
    <section class="row">
        <div class="col-12 col-lg-4">
            <h1>Customer Registration</h1>
            <form>
                <div class="form-group">
                    <label for="txtCustomerID">Customer ID</label>
                    <input name="cusID" class="form-control" id="txtCustomerID" type="text">
                    <span class="control-error" id="lblcusid"></span>
                </div>
                <div class="form-group">
                    <label for="txtCustomerName">Customer Name</label>
                    <input name="cusName" class="form-control" id="txtCustomerName" type="text">
                    <span class="control-error" id="lblcusname"></span>
                </div>
                <div class="form-group">
                    <label for="txtCustomerAddress">Customer Address</label>
                    <input name="cusAddress" class="form-control" id="txtCustomerAddress" type="text">
                    <span class="control-error" id="lblcusaddress"></span>
                </div>
                <div class="form-group">
                    <label for="txtCustomerSalary">Customer Salary</label>
                    <input name="cusSalary" class="form-control" id="txtCustomerSalary" type="text">
                    <span class="control-error" id="lblcussalary"></span>
                </div>
                <div class="btn-group">
                    <button formaction="customer?option=add" formmethod="post" class="btn btn-primary" id="btnCustomer">
                        Save Customer
                    </button>
                    <button formaction="customer?option=delete" formmethod="post" class="btn btn-danger"
                            id="btnCusDelete">Remove
                    </button>
                    <button formaction="customer?option=update" formmethod="post" class="btn btn-warning"
                            id="btnUpdate">Update
                    </button>
                    <button formaction="customer" class="btn btn-success" id="btnGetAll">Get All</button>
                    <button formaction="/pos_one" class="btn btn-danger" id="btn-clear1">Clear All</button>
                </div>
            </form>
        </div>
        <div class="col-12 col-lg-8 mt-3">
            <table class="table table-bordered table-hover">
                <thead class="bg-danger text-white">
                <tr>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Customer Address</th>
                    <th>Customer Salary</th>
                </tr>
                </thead>
                <tbody id="tblCustomer">
                <%
                    ArrayList<Customer> allCustomers = (ArrayList<Customer>) request.getAttribute("keyOne");
                    if (allCustomers != null) {
                %>
                <%for (Customer customer : allCustomers) { %>
                <tr>
                    <td><%=customer.getId()%>
                    </td>
                    <td><%=customer.getName()%>
                    </td>
                    <td><%=customer.getAddress()%>
                    </td>
                    <td><%=customer.getSalary()%>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </section>
</main>


<script src="../assets/js/jquery-3.6.1.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>

<!--<script>-->
<!--    //select the button and add an event to it-->
<!--    document.getElementById("btnCustomer").addEventListener("click", function () {-->

<!--        //get typed values of input fields-->
<!--        let id = document.getElementById("txtCustomerID").value;-->
<!--        let name = document.getElementById("txtCustomerName").value;-->
<!--        let address = document.getElementById("txtCustomerAddress").value;-->
<!--        let salary = document.getElementById("txtCustomerSalary").value;-->

<!--        //let's print it-->
<!--        console.log(id,name,address,salary);-->

<!--        //catch the table body-->
<!--        let tBody=document.getElementById("tblCustomer");-->

<!--        // let's see how we should insert a table row using html format-->
<!--        //<tr>-->
<!--        // <td>id</td>-->
<!--        // <td>name</td>-->
<!--        // <td>address</td>-->
<!--        // <td>salary</td>-->
<!--        // </tr>-->

<!--        //ok then, let's create the above row-->
<!--       let tr= document.createElement("tr");-->

<!--       //let's create another four columns-->
<!--       let col1= document.createElement("td");-->
<!--       let col2= document.createElement("td");-->
<!--       let col3= document.createElement("td");-->
<!--       let col4= document.createElement("td");-->

<!--       //set input fields values to the above created columns-->
<!--        col1.textContent=id;-->
<!--        col2.textContent=name;-->
<!--        col3.textContent=address;-->
<!--        col4.textContent=salary;-->

<!--        //set 4 columns to the previously created row-->
<!--        tr.appendChild(col1);-->
<!--        tr.appendChild(col2);-->
<!--        tr.appendChild(col3);-->
<!--        tr.appendChild(col4);-->

<!--        //set the row to the table body-->
<!--        tBody.appendChild(tr);-->

<!--        //Work done;-->
<!--    });-->
<!--</script>-->
</body>
</html>
