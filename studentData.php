<html>
    <body>
        <?php

        if (isset($_POST['submit-1'])) { // if form 1 submitted
            // get titles, classrooms, meeting days & times of classes
            // titles -> courses table | classrooms & meetings days -> sections table
            require_once('connect.php');
            echo 'Connected to Form 1 Successfully...<p><br>';

            $inputCNum = $_POST['cnum'];

            $query = "SELECT S.CNum, S.Section_Number, S.Classroom, S.Meeting_Time, E.Course_Number, E.Section_Number, COUNT(*)
                        FROM sections S, enrollment_record E
                        WHERE S.CNum = $inputCNum AND S.CNum = E.Course_Number AND S.Section_Number = E.Section_Number
                        GROUP BY E.Section_Number;";
            $result = $link->query($query);
            $rowCtr = $result->num_rows;
            
            echo '
            <ul style="list-style-type: none; box-sizing: border-box; padding: 0; margin: 0; display: flex; padding: 25px;">
                <li><a class="menuItem" style="text-decoration: none; background-color: royalblue; color: white; border-radius: 17px; padding: 10px; margin: 0 10px; align-items: center; justify-content: space-between;" href="index.html">Home</a></li>
                <li><a class="menuItem" style="text-decoration: none; background-color: royalblue; color: white; border-radius: 17px; padding: 10px; margin: 0 10px; align-items: center; justify-content: space-between;" href="student.html">Back</a></li>
            </ul>';

            echo '<p style="font-size: 25px; padding-left: 10px;"><strong>Course Sections:</strong><p>';
            echo '<table align="left" cellspacing="5" cellpadding="8">';

            for ($i = 0; $i < $rowCtr; $i++) {
                $row = $result->fetch_assoc();
                echo '<tr><td align="left">' . 'SECTION: ' . $row['Section_Number'] . '<p>';
                echo '<tr><td align="left">' . 'CLASSROOM: ' . $row['Classroom'] . '<p>';
                echo '<tr><td align="left">' . 'MEETING TIMES: ' . $row['Meeting_Time'] . '<p>';
                echo '<tr><td align="left">' . 'Enrolled Students: ' . $row['COUNT(*)'] . '<p><hr>';
            } // for
        
            $result->free_result();
            $link->close(); // closes database
        } // if
        else if (isset($_POST['submit-2'])) { // if form 2 submitted
            // # of students get each distinct grade in class
            require_once('connect.php');
            echo 'Connected to Form 2 Successfully...<p><br>';

            $inputCWID = $_POST['cwid'];

            $query = "SELECT E.CampusID, E.Course_Number, E.Grade
                        FROM enrollment_record E
                        WHERE E.CampusID = $inputCWID;";
            $result = $link->query($query);
            $rowCtr = $result->num_rows / 5; // for some reason it loops 5 times instead of once

            echo '
            <ul style="list-style-type: none; box-sizing: border-box; padding: 0; margin: 0; display: flex; padding: 25px;">
                <li><a class="menuItem" style="text-decoration: none; background-color: royalblue; color: white; border-radius: 17px; padding: 10px; margin: 0 10px; align-items: center; justify-content: space-between;" href="index.html">Home</a></li>
                <li><a class="menuItem" style="text-decoration: none; background-color: royalblue; color: white; border-radius: 17px; padding: 10px; margin: 0 10px; align-items: center; justify-content: space-between;" href="student.html">Back</a></li>
            </ul>';

            echo '<p style="font-size: 25px; padding-left: 10px;"><strong>Courses Taken:</strong><p>';
            echo '<table align="left" cellspacing="5" cellpadding="8">';

            for ($i = 0; $i < $rowCtr; $i++) {
                $row = $result->fetch_assoc();
                echo '<tr><td align="left">' . 'COURSE: ' . $row['Course_Number'] . '<p>';
                echo '<tr><td align="left">' . 'GRADE: ' . $row['Grade'] . '<p><hr>';
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
