     <aside id="slide-out" class="side-nav white fixed">
                <div class="side-nav-wrapper">
                    <div class="sidebar-profile">
                        <div class="sidebar-profile-image">
                            <img src="assets/images/profile-image.png" class="circle" alt="">
                        </div>
                        <div class="sidebar-profile-info">
                    <?php 
$eid=$_SESSION['eid'];
$sql = "SELECT FirstName,LastName,EmpId from  tblemployees where id=:eid";
$query = $dbh -> prepare($sql);
$query->bindParam(':eid',$eid,PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{               ?>  
                                <p><?php echo htmlentities($result->FirstName." ".$result->LastName);?></p>
                                <span><?php echo htmlentities($result->EmpId)?></span>
                         <?php }} ?>
                        </div>
                    </div>
              
                <ul class="sidebar-menu collapsible collapsible-accordion" data-collapsible="accordion">
                  
  <li class="no-padding"><a class="waves-effect waves-grey" href="myprofile.php"><i class="material-icons">hesap _ kutusu</i>Profillerim</a></li>
  <li class="no-padding"><a class="waves-effect waves-grey" href="emp-changepassword.php"><i class="material-icons">ayarlar_giriş_svideosu</i>Şifre değiştir</a></li>
                    <li class="no-padding">
                        <a class="collapsible-header waves-effect waves-grey"><i class="material-icons">uygulamalar</i>izinler<i class="nav-drop-icon material-icons">klavye _ ok _ sağ</i></a>
                        <div class="collapsible-body">
                            <ul>
                                <li><a href="apply-leave.php">İzin Uygula</a></li>
                                <li><a href="leavehistory.php">İzin geçmişi</a></li>
                            </ul>
                        </div>
                    </li>
                
         
               
                  <li class="no-padding">
                                <a class="waves-effect waves-grey" href="logout.php"><i class="material-icons">exit_to_app</i>Oturumu Kapat</a>
                            </li>  
                 
                   
                </ul>
               
                </div>
            </aside>