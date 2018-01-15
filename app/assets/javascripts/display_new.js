$(document).ready(function(){

    // Display all smartphones models or category models
    $("#show_all_models").change(function(){
      var request =  $("input[name=item]").val();
      var check = $("#checkbox").is(":checked");
      if(request == 'smartphone'){
        if(check){
          $("#select_all_models").show();
          $(".model_text").show();
          $("#models").hide();
        }
        else{
          $("#select_all_models").hide();
          $(".model_text").hide();
          $("#models").show();
        }
      }
    }).change();

    // Display sim and number for portability
    var display_menus = function(){
      var request = $("input[name=item]").val();
      var w_sim = $('input:checked[name="want_sim"]').val();
      var w_number = $('input:checked[name="want_new_number"]').val();
      if(w_sim == 'true' || request == 'sim') {
          $("#want_number").show();
          if(w_number == 'false'){
              $("#number").show();
          }
          else{
              $("#number").hide();
          }
      }
      else if(w_sim == 'false' || request == 'sim'){
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
    var display_plans = function(){
        $("#region").find("option:selected").each(function(){
            var region = $("#region option:selected").val();
            var request =  $("input[name=item]").val();
            var country = $("#"+region+" option:selected").val();
            $("#africa option:selected").val(country);
            var plan = $("#plan option:selected").val();
            $(".roaming_country").hide()
            $(".roaming_plan_bag").hide()
            $(".roaming_details").hide()
            if(request == 'roaming'){
              $("#"+region).show()
              if (country != 'otro'){
                $("#bag option:selected").val(plan);
                $("#plan").show()
                $("#bag").hide()
                $("#details_"+plan).show()
              }
              else{
                $("#bag").show()
                $("#plan").hide()
              }
            }
        });
    };

    // Display plan details bam
    $("#bam_plans").change(function(){
        $("#bam_plans").find("option:selected").each(function(){
            var request =  $("input[name=item]").val();
            var detail = $("#bam_plans option:selected").val();
            $(".bam_details").hide()
            if(request == 'bam'){
              $("#bam_details_"+detail).show()
            }
        });
    }).change();

    // Submit Event
    $("form").submit(function(e){
      var phone = $.trim($('input[name="phone_number"]').val());
      var request =  $("input[name=item]").val();
      var w_sim = $('input:checked[name="want_sim"]').val();
      var w_new_number = $('input:checked[name="want_new_number"]').val();
      var start_date = new Date($('input[name="start_date"]').val());
      var end_date = new Date($('input[name="end_date"]').val());
      var comment = $.trim($("#comment").val());
      var check = $("#checkbox").is(":checked");

      if(request == 'smartphone' && check == true && comment.length < 10){
        swal({
          title: 'Datos Inválidos!',
          text: 'Debes Ingresar una descripción de al menos 10 caracteres en el motivo de eleccion del modelo que has elegido',
          type: 'error',
          confirmButtonText: 'Aceptar',
          confirmButtonColor: "#DD6B55",
        });
        e.preventDefault();
      }
      else if((request == 'smartphone' && w_sim == 'true' && w_new_number == 'false') ||
      (request == 'sim' && w_new_number == 'false')){
        if( phone.length != 8 || !$.isNumeric(phone)){
          swal({
            title: 'Datos Inválidos!',
            text: 'Ingrese número válido',
            type: 'error',
            confirmButtonText: 'Aceptar',
            confirmButtonColor: "#DD6B55",
          });
          e.preventDefault();
        }
      }
      else if(request == 'roaming'){
        if( isNaN(start_date) || isNaN(end_date) ){
          swal({
            title: 'Datos Inválidos!',
            text: 'Debes Ingresar una fecha para inicio y termino de viaje',
            type: 'error',
            confirmButtonText: 'Aceptar',
            confirmButtonColor: "#DD6B55",
          });
          e.preventDefault();
        }
        else if(start_date > end_date){
          swal({
            title: 'Datos Inválidos!',
            text: 'La fecha de término del viaje debe ser posterior a la fecha de inicio',
            type: 'error',
            confirmButtonText: 'Aceptar',
            confirmButtonColor: "#DD6B55",
          });
          e.preventDefault();
        }
        else if(comment.length < 10){
          swal({
            title: 'Datos Inválidos!',
            text: 'Debes Ingresar una descripción de al menos 10 caracteres en el motivo del viaje',
            type: 'error',
            confirmButtonText: 'Aceptar',
            confirmButtonColor: "#DD6B55",
          });
          e.preventDefault();
        }
      }
    });

    // Link events to function
    $(display_menus)
    $(display_plans)
    $("#region, .roaming_country, .roaming_plan_bag").change(display_plans);
    $('input[name="want_sim"]').change(display_menus);
    $('input[name="want_new_number"]').change(display_menus);

  });
