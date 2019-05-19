// var ajax_index = function(){
//   $.get("/posts/index",function(data){
//      $("local_div").html(data.integer);
//   });
// }
// $(function(){
//   setInterval(ajax_index, 500);
// });

console.log("Welcome bro from posts.js!");

var posts = gon.posts
window.setInterval(getPosts,3000)
function getPosts()
{
  document.getElementById("posts_div").innerHTML = ""
  posts.forEach(function(element)
  {
    //$("post_div").html(element.content)
    var newDiv = document.createElement("div");
    newDiv.innerHTML = element.content
    document.getElementById("posts_div").appendChild(newDiv)
  })



}
