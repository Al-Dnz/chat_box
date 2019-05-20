// var ajax_index = function(){
//   $.get("/posts/index",function(data){
//      $("local_div").html(data.integer);
//   });
// }
// $(function(){
//   setInterval(ajax_index, 500);
// });

console.log("Welcome bro from posts.js!");



$( document ).ready(function() {
  $("#submit_btn").click(function() { $(this).removeAttr('disabled'), console.log("cliked!") });
  getPosts;
});

//var scrollDown = function(){
//   var objDiv = document.getElementById("posts_div");
//   objDiv.scrollTop = objDiv.scrollHeight;
// }

var getPosts = function(posts)
{
  document.getElementById("posts_div").innerHTML = "";
  //scrollDown;
  posts.forEach(function(element)
  {
    //$("post_div").html(element.content)
    var newDiv = document.createElement("div");
    newDiv.innerHTML = element.user+ " dit : "+ element.content;
    document.getElementById("posts_div").appendChild(newDiv);
    var objDiv = document.getElementById("posts_div");
    objDiv.scrollTop = objDiv.scrollHeight;
  })

}
gon.watch( "posts" , {interval: 500}, getPosts );
