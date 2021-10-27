// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

/* global $*/

$(document).on('turbolinks:load', function() { //slick機能
    $('.slider').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      dots: true,
      autoplay: true,
      autoplaySpeed: 2000
    });
});

$(document).on('turbolinks:load', function() { //slick機能
    $('.slider').slick({
    responsive: [
        {
      breakpoint: 768,  //ブレイクポイントを指定
      settings: {
        slidesToShow: 1,
      }},{
      breakpoint: 425,
      settings: {
        slidesToShow: 1,
      }},]
 });
});

function copyToClipboard() {
    // コピー対象をJavaScript上で変数として定義する
    var copyTarget = document.getElementById("copyTarget");

    // コピー対象のテキストを選択する
    copyTarget.select();

    // 選択しているテキストをクリップボードにコピーする
    document.execCommand("Copy");

    // コピーをお知らせする
    alert("メールアドレスをコピーしました。飼い主にメールを送りましょう。 : " + copyTarget.value);
}