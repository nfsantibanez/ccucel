$(document).ready(function(){

    // Display request types
    $(".select_1").change(function(){
        $(this).find("option:selected").each(function(){
            var request = $(this).val();
            var w_sim = $('input:checked[name="want_sim"]').val();
            var w_number = $('input:checked[name="want_new_number"]').val();
            $('input[name="number"]').val("");
            if(request == 'smartphone'){
                $("#models").show();
                $("#bam_models").hide();
                $("#want_sim").show();
                $(".roaming").hide();
                if(w_sim == 'true'){
                  $("#want_number").show();
                  if(w_number == 'false'){
                      $("#number").show();
                  }
                  else{
                      $("#number").hide();
                  }
                }
                else{
                  $("#want_number").hide();
                  $("#number").hide();
                }
            }
            else if(request == 'sim'){
              $("#models").hide();
              $("#bam_models").hide();
              $("#want_sim").hide();
              $("#want_number").show();
              $(".roaming").hide();
              if(w_number == 'false'){
                  $("#number").show();
              }
              else{
                  $("#number").hide();
              }
            }
            else if(request == 'bam'){
                $("#models").hide();
                $("#want_sim").hide();
                $("#want_number").hide();
                $("#number").hide();
                $("#bam_models").show();
                $(".roaming").hide();
            }
            else if(request == 'roaming'){
                $("#models").hide();
                $("#want_sim").hide();
                $("#want_number").hide();
                $("#number").hide();
                $("#bam_models").hide();
                $(".roaming").show();
            }
        });
    }).change();

    // Display secondary menus
    var display_menus = function(){
      var request = $(".select_1 option:selected").val();
      var w_sim = $('input:checked[name="want_sim"]').val();
      var w_number = $('input:checked[name="want_new_number"]').val();
      if(w_sim == 'true') {
          $("#want_number").show();
          if(w_number == 'false'){
              $("#number").show();
          }
          else{
              $("#number").hide();
          }
      }
      else if(w_sim == 'false'){
        if (request != 'sim'){
          $("#want_number").hide();
          $("#number").hide();
        }
        else{
          if(w_number == 'false'){
              $("#number").show();
          }
          else{
              $("#number").hide();
          }
        }
      }
    };

    // Display countries and plan/bag details
    $("#region, .select_1, .roaming_country, .roaming_plan_bag").change(function(){
        $("#region").find("option:selected").each(function(){
            var region = $("#region option:selected").val();
            var request = $(".select_1 option:selected").val();
            var country = $("#"+region+" option:selected").val();
            var plan = $("#plan option:selected").val();
            $(".roaming_country").hide()
            $(".roaming_plan_bag").hide()
            $(".roaming_details").hide()
            if(request == 'roaming'){
              $("#"+region).show()
              if (country != 'otro'){
                $("#plan").show()
                $("#bag").hide()
                $("#details_"+plan).show()
              }
              else{
                $("#bag").show()
                $("#plan").hide()
                $("#details_"+bag).show()
              }
            }
        });
    }).change();

    // Display plan details bam
    $("#bam_models, .select_1").change(function(){
        $("#bam_models").find("option:selected").each(function(){
            var request = $(".select_1 option:selected").val();
            var detail = $("#bam_models option:selected").val();
            $(".bam_details").hide()
            if(request == 'bam'){
              $("#bam_details_"+detail).show()
            }
        });
    }).change();

    // Submit Event
    $("form").submit(function(e){
      var phone = $.trim($('input[name="number"]').val());
      var request = $(".select_1 option:selected").val();
      var w_sim = $('input:checked[name="want_sim"]').val();
      var w_new_number = $('input:checked[name="want_new_number"]').val();
      var start_date = $("#start_date").datepicker({ dateFormat: 'dd,MM,yyyy' }).val();
      var end_date = $("#end_date").datepicker({ dateFormat: 'dd,MM,yyyy' }).val();
      var comment = $.trim($('input[name="comment"]').val());

      if((request == 'smartphone' && w_sim == 'true' && w_new_number == 'false') ||
      (request == 'sim' && w_new_number == 'false')){
        if( phone.length != 8 || !$.isNumeric(phone)){
          alert('Ingrese número válido');
          e.preventDefault(e);
        }
      }
      else if(request == 'roaming'){
        console.log(start_date);
        console.log(end_date);
        console.log(comment);

      }
    });

    // Link events to function
    $('input[name="want_sim"]').change(display_menus);
    $('input[name="want_new_number"]').change(display_menus);
    $(".roaming_country").hide();

  });
