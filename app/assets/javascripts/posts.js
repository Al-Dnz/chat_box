console.log("Welcome bro the Tchat Box !");
var initialNumberPost = document.getElementsByClassName("single-post").length;
var posts = gon.posts;

$(document).ready(function() {
  // getPosts(posts)

});

function getPosts(posts) {
  document.getElementById("posts_div").innerHTML = "";
  //scrollDown;
  posts.forEach(function(element) {
    var newDiv = document.createElement("div");
    newDiv.setAttribute("class", "single-post")
    newDiv.innerHTML = element.user + " dit : ";
    var contentSpan = document.createElement("span");
    contentSpan.innerHTML = element.content;
    contentSpan.classList.add("span-color")
    newDiv.appendChild(contentSpan);
    document.getElementById("posts_div").appendChild(newDiv);
    //document.getElementById("posts_div").appendChild(contentSpan);
    scrollToBottom("posts_div")
  })
  initialNumberPost = document.getElementsByClassName("single-post").length;
  pushEnter()
}

// gon.watch("posts", {
//   interval: 500
// }, postCount);

function postCount(posts) {
  newPostNumber = posts.length;
  // console.log("newPostNumber-->"+ newPostNumber);
  // console.log("initialNumberPost-->"+ initialNumberPost);
  if (newPostNumber !== initialNumberPost) {
    getPosts(posts);
  }
}

function scrollToBottom(id) {
  var div = document.getElementById(id);
  div.scrollTop = div.scrollHeight - div.clientHeight;
  //console.log("hello from scrolling");
}

function pushEnter() {
  var form = document.getElementById("main-form")
  form.addEventListener("keydown", function(e) {
    // if (!e) { var e = window.event; }
    // e.preventDefault(); // sometimes useful
    // Enter is pressed
    if (e.keyCode == 13) {
      submitFunction()
    }
  });
}

function submitFunction() {
  document.getElementById("submit_btn").click();
  document.getElementById('content-area').value = '';
}
