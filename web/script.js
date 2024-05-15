paragraphs = document.querySelectorAll("p");

// starting with 0 opacity, fade in each paragraph, one by one
paragraphs.forEach(function (paragraph, index) {
  paragraph.style.opacity = 0;
  setTimeout(function () {
    paragraph.style.transition = "opacity 1s";
    paragraph.style.opacity = 1;
  }, index * 500);
});
a;
