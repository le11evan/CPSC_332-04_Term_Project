<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="favicon.ico"
        type="image/x-icon">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Professor Info</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">CPSC 332-04 Term Project</a>
        
            <ul class="nav navbar-nav">
            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="find_Courses.html">Find Courses</a></li>
                <li class="nav-item"><a class="nav-link" href="find_Grades.html">Find Grades</a></li>
                <li class="nav-item"><a class="nav-link" href="find_Prof_Info.html">Find Professor Info</a></li>
                <li class="nav-item"><a class="nav-link" href="find_Grade_Count.html">Find Grade Count</a></li>
            </ul>
        </nav>
        <div class="container">
            <?php  
                $search_var = $_POST["search_pSSN"];
                echo "<h3>Results for search '{$search_var}'</h3>";
                $db_con = mysqli_connect("mariadb", "cs332t23", "TEmjm59C", "cs332t23");
                if (mysqli_connect_errno()) {
                    echo "Error code: " . mysqli_connect_errno();
                    echo "Failed to connect to MySQL: " . mysqli_connect_error();
                }
                $result = mysqli_query($db_con, "SELECT c.C_Title, CS.CNum, CS.Room, CS.MDays, CS.BegTime, CS.EndTime
				FROM Professor
				INNER JOIN Course_Section CS ON Professor.SSN = CS.Teacher
				INNER JOIN Course c ON c.CNum = CS.CNum
				WHERE Professor.SSN = '$search_var'");
                if ($result) {
                    echo "<table class='table'>";
                    echo "<thead>";
                    echo "<tr>";
                    echo "<th scope='col'>Course Title</th>";
                    echo "<th scope='col'>Course Number</th>";
					echo "<th scope='col'>Room</th>";
                    echo "<th scope='col'>Meeting Days</th>";
                    echo "<th scope='col'>Beginning Time</th>";
                    echo "<th scope='col'>End Time</th>";
                    echo "</tr>";
                    echo "</thead>";
                    echo "<tbody>";
                    while ($row = mysqli_fetch_row($result)) {
                        echo "<tr>";
                        for ($i = 0; $i < count($row); $i++) {
                            echo "<td>{$row[$i]}</td>";
                        }
                        echo "</tr>";
                    }
                    mysqli_free_result($result);    
                }
                else {
                    echo "<strong>No data found...</strong>";
                }
                mysqli_close($db_con);
                ?>
        </div>
    </body>
</html>
