(function (){
  'use strict';

  var express   = require("express")
    , request   = require("request")
    , endpoints = require("../endpoints")
    , helpers   = require("../../helpers")
    , app       = express()

  app.get("/catalogue/images*", function (req, res, next) {
    var url = endpoints.catalogueUrl + req.url.toString();
    request.get(url)
        .on('error', function(e) { next(e); })
        .pipe(res);
  });

  app.get("/catalogue*", function (req, res, next) {
    // console.log("x-request-id: " + req.headers['x-request-id']);
    // console.log("x-b3-traceid: " + req.headers['x-b3-traceid']);
    // console.log("x-b3-spanid: " + req.headers['x-b3-spanid']);
    // console.log("x-b3-parentspanid: " + req.headers['x-b3-parentspanid']);
    // console.log("x-b3-sampled: " + req.headers['x-b3-sampled']);
    // console.log("x-b3-flags: " + req.headers['x-b3-flags']);
    // console.log("x-ot-span-context: " + req.headers['x-ot-span-context']);
    helpers.simpleHttpRequest(endpoints.catalogueUrl + req.url.toString(), req, res, next);
  });

  app.get("/tags", function(req, res, next) {
    helpers.simpleHttpRequest(endpoints.tagsUrl, req, res, next);
  });

  module.exports = app;
}());
