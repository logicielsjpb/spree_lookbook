$(document).ready(function(){
    console.log($("[href='#remove_line']"));
    $("[href='#remove_line']").click(function(e){
        e.preventDefault();
        $(this).parents("tr").find("[data-hook='deleter']").val("true");
        $(this).parents("tr").hide();
    })
})