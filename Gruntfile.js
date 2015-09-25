var scssFiles = {'./aishack/static/css/custom.css': './aishack/static/css/custom.scss'};

var cssFiles = ['./aishack/static/css/bootstrap.orange.min.css',
                './aishack/static/css/bootstrap-editable.css',
                './aishack/static/css/custom.css'];

var coffeeFiles = ['./aishack/static/js/custom.coffee'];

var jsFiles = ['./aishack/static/js/jquery-1.11.1.min.js',
               './aishack/static/js/bootstrap.min.js',
               './aishack/static/js/bootstrap-editable.min.js',
               './aishack/static/js/custom.js'];

module.exports = function(grunt) {

  grunt.initConfig({
    jshint: {
      files: ['Gruntfile.js', 'src/**/*.js', 'test/**/*.js'],
      options: {
        globals: {
          jQuery: true
        }
      }
    },
    sass: {
        options: {
            sourceMap: false
        },
        dist: {
            files: scssFiles
        }
    },
    cssmin: {
        options: {
            shorthandCompacting: false,
            roundingPrecision: -1
        },
        target: {
            files: {
                './aishack/static/css/styles.min.css': cssFiles
            }
        }
    },
    uglify: {
        my_target: {
            files: {
                './aishack/static/js/bundle.min.js': jsFiles
            }
        }
    },
    coffee: {
        compile: {
            files: {
                './aishack/static/js/custom.js': coffeeFiles
            }
        },
    },
    watch: {
      cssstuff: {
          files: ['./aishack/static/css/custom.scss'],
          tasks: ['sass', 'cssmin']
      }
    }
  });

  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-coffee');

  grunt.registerTask('default', ['sass', 'cssmin', 'coffee', 'uglify']);
};
