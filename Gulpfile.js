// *************************************
//
//   Gulpfile
//
// *************************************
//
// Available tasks:
//   `gulp`
//   `gulp test-css`
//   `gulp test-js`
//
// *************************************

// -------------------------------------
//   Modules
// -------------------------------------
//
// gulp              : The streaming build system
// gulp-csscss       : CSS redundancy analyzer
// gulp-jshint       : JavaScript code quality tool
// gulp-load-plugins : Automatically load Gulp plugins
// gulp-parker       : Stylesheet analysis tool
// gulp-plumber      : Prevent pipe breaking from errors
//
// -------------------------------------

var gulp    = require( 'gulp' );
var plugins = require( 'gulp-load-plugins' )();

// -------------------------------------
//   Options
// -------------------------------------

var options = {

  default : {
    tasks : [ 'test-css', 'test-js' ]
  },

  css : {
    file : 'build/assets/stylesheets/application.css'
  },

  js : {
    file : 'build/assets/javascripts/application.js'
  }

};

// -------------------------------------
//   Task: Default
// -------------------------------------

gulp.task( 'default', function() {

  options.default.tasks.forEach( function(task) {
    gulp.start( task );
  } );

} );

// -------------------------------------
//   Task: Test CSS
// -------------------------------------

gulp.task( 'test-css', function() {

  gulp.src( options.css.file )
    .pipe( plugins.plumber() )
    .pipe( plugins.parker() )

  gulp.src( options.css.file )
    .pipe( plugins.plumber() )
    .pipe( plugins.csscss() )

});

// -------------------------------------
//   Task: Test JS
// -------------------------------------

gulp.task( 'test-js', function() {

  gulp.src( options.js.file )
    .pipe( plugins.plumber() )
    .pipe( plugins.jshint() )
    .pipe( plugins.jshint.reporter( 'default' ) )

});
