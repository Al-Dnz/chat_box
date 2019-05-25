
console.log("Welcome bro from posts.js!");
var initialNumberPost = document.getElementsByClassName("single-post").length;

$( document ).ready(function() {
  getPosts(posts)
  //$("#submit_btn").click(function() { document.getElementById("content-area").value = "" });
  // $("main-form").on("keypress", function (e) {
  //   if (e.keyCode == 13) {
  //       return false;
  //   }
  //     });
      //scrollToBottom("posts_div")

});



function getPosts(posts)
  {
    document.getElementById("posts_div").innerHTML = "";
    //scrollDown;
    posts.forEach(function(element)
    {
      //$("post_div").html(element.content)
      var newDiv = document.createElement("div");
      newDiv.setAttribute("class","single-post")
      newDiv.innerHTML = element.user+ " dit : ";
      var contentSpan = document.createElement("span");
      contentSpan.innerHTML =  element.content;
      contentSpan.classList.add("span-color")
      newDiv.appendChild(contentSpan);
      document.getElementById("posts_div").appendChild(newDiv);
      //document.getElementById("posts_div").appendChild(contentSpan);
      scrollToBottom("posts_div")
    })
    initialNumberPost =  document.getElementsByClassName("single-post").length;
  }

gon.watch( "posts" , {interval: 500}, postCount );

function postCount(posts)
  {
    newPostNumber = posts.length;
    console.log("newPostNumber-->"+ newPostNumber);
    console.log("initialNumberPost-->"+ initialNumberPost);
    if (newPostNumber !== initialNumberPost )
      {
        getPosts(posts);
      }
  }


function scrollToBottom(id)
{
   var div = document.getElementById(id);
   div.scrollTop = div.scrollHeight - div.clientHeight;
   console.log("hello from scrolling");
}

// var scrollDown = function(){
  // var objDiv = document.getElementById("posts_div");
  // objDiv.scrollTop = objDiv.scrollHeight;
// }


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
