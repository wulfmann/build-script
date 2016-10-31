"use strict";

/* dependencies */
var gulp = require('gulp'),

    /* styles */
    sourcemaps      = require('gulp-sourcemaps'),
    sass            = require('gulp-sass'),
    autoprefixer    = require('gulp-autoprefixer'),
    concat          = require('gulp-concat'),
    minifyCSS       = require('gulp-minify-css'),
    rename          = require('gulp-rename'),

    /* html */
    data            = require('gulp-data'),
    nunjucksRender  = require('gulp-nunjucks-render'),

    /* serve */
    browserSync     = require('browser-sync').create(),
    reload          = browserSync.reload,

    /* images */
    imagemin        = require('gulp-imagemin'),
    
    /* bourbon + neat */
    bourbon         = require("node-bourbon").includePaths,
    neat            = require("node-neat").includePaths;


/* server + browser-sync */
gulp.task('serve', ['styles'], function() {

    browserSync.init({
        server: "./dist"
    });
});

/* images task */
gulp.task('images', function() {
    gulp.src(paths.imgSrc + '**/*')
        .pipe(imagemin())
        .pipe(gulp.dest('dist/img'))
});

/* default task. this is run by using the 'gulp' command */
gulp.task('default', ['images', 'nunjucks', 'styles', 'serve']);