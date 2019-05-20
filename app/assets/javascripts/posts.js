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
  //$("#submit_btn").click(function() { document.getElementById("content-area").value = "" });
  $("main-form").on("keypress", function (e) {
    if (e.keyCode == 13) {
        return false;
    }
      });
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
    newDiv.innerHTML = element.user+ " dit : ";
    var contentSpan = document.createElement("span");
    contentSpan.innerHTML =  element.content;
    contentSpan.classList.add("span-color")
    newDiv.appendChild(contentSpan);
    document.getElementById("posts_div").appendChild(newDiv);
    //document.getElementById("posts_div").appendChild(contentSpan);
    var objDiv = document.getElementById("posts_div");
    objDiv.scrollTop = objDiv.scrollHeight;

  })

}
gon.watch( "posts" , {interval: 500}, getPosts );



// document.getElementById("main-form").addEventListener("keydown", function(e) {
//     if (!e) { var e = window.event; }
//     e.preventDefault(); // sometimes useful
//
//     // Enter is pressed
//     if (e.keyCode == 13) { submitFunction(); }
// }, false);


// document.getElementById('main-form').addEventListener("keypress", function(e) {
//     if (e.keyCode == 13) {
//         return false;
//     }
// });
