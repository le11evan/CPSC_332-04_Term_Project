<html>
    <body>
        <?php

        if (isset($_POST['submit-1'])) { // if form 1 submitted
            // get titles, classrooms, meeting days & times of classes
            // titles -> courses table | classrooms & meetings days -> sections table
            require_once('connect.php');
            echo 'Connected to Form 1 Successfully...<p><br>';

            $inputSSN =  $_POST['ssn'];

            $query = "SELECT S.CNum, S.Classroom, S.Meeting_Time, C.Course_Number, C.Title
                            FROM sections S, courses C
                            WHERE S.Professor_SSN = $inputSSN AND S.CNum = C.Course_Number;";
            $result = $link->query($query);
            $rowCtr = $result->num_rows;

            echo '
            <ul style="list-style-type: none; box-sizing: border-box; padding: 0; margin: 0; display: flex; padding: 25px;">
                <li><a class="menuItem" style="text-decoration: none; background-color: royalblue; color: white; border-radius: 17px; padding: 10px; margin: 0 10px; align-items: center; justify-content: space-between;" href="index.html">Home</a></li>
                <li><a class="menuItem" style="text-decoration: none; background-color: royalblue; color: white; border-radius: 17px; padding: 10px; margin: 0 10px; align-items: center; justify-content: space-between;" href="professor.html">Back</a></li>
            </ul>';

            echo '<p style="font-size: 25px; padding-left: 10px;"><strong>Scheduling:</strong><p>';
            echo '<table align="left" cellspacing="5" cellpadding="8">';

            for ($i = 0; $i < $rowCtr; $i++) {
                $row = $result->fetch_assoc();
                echo '<tr><td align="left">' . 'TITLE: ' . $row['Title'] . '<p>';
                echo '<tr><td align="left">' . 'CLASSROOM: ' . $row['Classroom'] . '<p>';
                echo '<tr><td align="left">' . 'MEETING TIMES: ' . $row['Meeting_Time'] . '<p><hr>';
            } // for
        
            $result->free_result();
            $link->close(); // closes database
        } // if
        else if (isset($_POST['submit-2'])) { // if form 2 submitted
            // # of students get each distinct grade in class
            require_once('connect.php');
            echo 'Connected to Form 2 Successfully...<p><br>';

            $inputCNum = $_POST['cnum'];
            $inputSNum = $_POST['snum'];

            $query = "SELECT E.Grade, COUNT(*) 
                        FROM sections S, courses C, enrollment_record E
                        WHERE C.Course_Number = $inputCNum AND S.Section_Number = $inputSNum AND
                            C.Course_Number = S.CNum AND S.CNum = E.Course_Number AND E.Section_Number = S.Section_Number
                        GROUP BY E.Grade;";
            $result = $link->query($query);
            $rowCtr = $result->num_rows;

            echo '
            <ul style="list-style-type: none; box-sizing: border-box; padding: 0; margin: 0; display: flex; padding: 25px;">
                <li><a class="menuItem" style="text-decoration: none; background-color: royalblue; color: white; border-radius: 17px; padding: 10px; margin: 0 10px; align-items: center; justify-content: space-between;" href="index.html">Home</a></li>
                <li><a class="menuItem" style="text-decoration: none; background-color: royalblue; color: white; border-radius: 17px; padding: 10px; margin: 0 10px; align-items: center; justify-content: space-between;" href="professor.html">Back</a></li>
            </ul>';

            echo '<p style="font-size: 25px; padding-left: 10px;"><strong>Grades:</strong><p>';
            echo '<table align="left" cellspacing="5" cellpadding="8">';
            
            for ($i = 0; $i < $rowCtr; $i++) {
                $row = $result->fetch_assoc();
                echo '<tr><td align="left">' . 'GRADE: ' . $row['Grade'] . '<p>';
                echo '<tr><td align="left">' . 'COUNT: ' . $row['COUNT(*)'] . '<p><hr>';
            } // for
        
            $result->free_result();
            $link->close(); // closes database
        } // if
        else {
            echo "ERROR: Forms not submitted correctly";
        } // else

        ?>
    </body>
</html>
