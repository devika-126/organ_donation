<?php 
  require 'file/connection.php';
  session_start();
  if(!isset($_SESSION['hid']))
  {
  header('location:login.php');
  }
  else {
?>
<!DOCTYPE html>
<html>
<?php $title="Bloodbank | Add blood samples"; ?>
<?php require 'head.php'; ?>
<style>
    body{
    background: url(image/p1.jpg) no-repeat center;
    background-size: cover;
    min-height: 0;
    height: 100%;
  }
.login-form{
    width: calc(100% - 20px);
    max-height: 650px;
    max-width: 450px;
    background-color: white;
}
</style>
<body>
  <?php require 'header.php'; ?>

    <div class="container cont">

      <?php require 'message.php'; ?>

      <div class="row justify-content-center">
          
         <div class="col-lg-4 col-md-5 col-sm-6 col-xs-7 mb-5">
          <div class="card">
            <div class="card-header title">Add organ available in your hospital</div>
        <div class="card-body">
        <form action="file/infoAdd.php" method="post">
          <a data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" title="click to see">Term & conditions. </a><br>
          <div class="collapse" id="collapseExample">
          When you donate an organ, whether it's a kidney, liver, or other vital organ, it's typically done in a hospital setting by skilled medical professionals. The process involves thorough screening, careful surgical extraction, and preservation techniques, ensuring compatibility for potential recipients waiting for life-saving transplants.<br><br>
        </div>
          <input type="checkbox" name="condition" value="agree" required> Agree<br><br>
          <select class="form-control" name="bg" required="">
                
                <option>Liver</option>
                <option>Kidney</option>
                <option>Heart</option>
                <option>Lungs</option>
                <option>Face</option>
                <option>Hands</option>
                <option>Intestines</option>
                <option>Pancreas</option>
          </select><br>
          <input type="submit" name="add" value="Add" class="btn btn-primary btn-block"><br>
          <a href="hospitalpage.html" class="text-centre" >Cancel</a><br>
        </form>
         </div>
       </div>
     </div>

<?php   if(isset($_SESSION['hid'])){
    $hid=$_SESSION['hid'];
    $sql = "select * from bloodinfo where hid='$hid'";
    $result = mysqli_query($conn, $sql);
  }
  ?>
    <div class="col-lg-4 col-md-5 col-sm-6 col-xs-7 mb-5">
          <table class="table table-striped table-responsive">
            <th colspan="4" class="title">Organ Bank</th>
            <tr>
              <th>#</th>

              <th>Organs</th>
              <th>Action</th>
            </tr>
            <div>
                <?php
                if ($result) {
                    $row =mysqli_num_rows( $result);
                    if ($row) { //echo "<b> Total ".$row." </b>";
                }else echo '<b style="color:white;background-color:red;padding:7px;border-radius: 15px 50px;">Nothing to show.</b>';
            }
            ?>
            </div>
            <?php while($row = mysqli_fetch_array($result)) { ?>
            <tr>
              <td><?php echo ++$counter; ?></td>

              <td><?php echo $row['bg'];?></td>
              <td><a href="file/delete.php?bid=<?php echo $row['bid'];?>" class="btn btn-danger">Delete</a></td>
            </tr>
            <?php } ?>
          </table>
      </div>

   </div>
</div>
<?php require 'footer.php' ?>
</body>
<?php } ?>