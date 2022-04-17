
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('rd/C_rd_history/edit_note',$attributes);

foreach($update_note as $row)
{
?>

<div class="form-group">
  <label class="control-label col-sm-2" for="comments">Note:</label>
  <div class="col-sm-10">
     <textarea name="comments" class="form-control"><?php echo $row['comments'] ?></textarea>
  </div>
</div>

<?php 

echo form_hidden('id',$row['id']);

echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
echo '<div class="col-sm-10">';
echo form_submit('submit','Update','class="btn btn-success"');
echo '</div></div>';
}
echo form_close();

?>
</div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->