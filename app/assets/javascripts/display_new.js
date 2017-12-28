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
                $(".roaming_country").hide();
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
              $(".roaming_country").hide();
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
                $("#roaming").hide();
                $(".roaming_country").hide();
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
                console.log($("#details_"+plan));
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

    // Display details of plan/bag
    $("#region, .select_1, .roaming_country").change(function(){
        $("#region").find("option:selected").each(function(){
            var region = $("#region option:selected").val();
            var request = $(".select_1 option:selected").val();
            var country = $("#"+region+" option:selected").val();
            var plan = $("#plan option:selected").val();
            var bag = $("#bag option:selected").val();
        });
    }).change();

    // Submit Event
    $("form").submit(function(e){
      var phone = $.trim($('input[name="number"]').val());
      var request = $(".select_1 option:selected").val();
      var w_sim = $('input:checked[name="want_sim"]').val();
      var w_new_number = $('input:checked[name="want_new_number"]').val();

      if((request == 'smartphone' && w_sim == 'true' && w_new_number == 'false') ||
      (request == 'sim' && w_new_number == 'false')){
        if( phone.length != 8 || !$.isNumeric(phone)){
          alert('Ingrese número válido');
          e.preventDefault(e);
        }
      }
    });

    // Link events to function
    $('input[name="want_sim"]').change(display_menus);
    $('input[name="want_new_number"]').change(display_menus);
    $(".roaming_country").hide();

  });
