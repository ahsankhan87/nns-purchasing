<div class="row">
  <div class="col-sm-12">

    <?php
    $attributes = array('class' => 'form-horizontal', 'role' => 'form', 'enctype' => "multipart/form-data");
    echo validation_errors();
    echo form_open('hr_finance/C_expenseSubCategory/create', $attributes);

    ?>
    <div class="form-group">
      <label class="control-label col-sm-2" for="Category">Category:<span class="required">* </span></label>
      <div class="col-sm-10">
        <?php echo form_dropdown('category_id',$categoryDDL,set_value('category_id'),'class="form-control select2me"'); ?>
        								
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="Name">Name:<span class="required">* </span></label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name" name="name" placeholder="Name" />
      </div>
    </div>

    <?php
    //echo '<div class="form-group"><label class="control-label col-sm-2" for="status">Status</label>';
    //echo '<div class="col-sm-10">';
    //$option = array('active'=>'active','inactive'=>'inactive');
    //echo form_dropdown('status',$option,'','class="form-control"') . '</div></div>';


    echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
    echo '<div class="col-sm-10">';
    echo form_submit('submit', 'Submit', 'class="btn btn-success"');
    echo '</div></div>';

    echo form_close();

    ?>
  </div>
  <!-- /.col-sm-12 -->
</div>
<!-- /.row -->