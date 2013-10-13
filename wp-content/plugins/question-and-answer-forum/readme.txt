=== Question and Answer Forum ===
Contributors: trevorpythag, Tristan Petersen
Donate link: http://qandaforum.trevorpythag.co.uk
Tags: questions, answers, forum
Requires at least: 3.0
Tested up to: 3.4
Stable tag:2.1.4
version:2.1.4
Allows a question and answer forum to be added to a site/blog. Can be fully integrated with your theme using custom post types.

== Description ==
Allows a question and answer forum to be added to a site/blog. Can be fully integrated with your theme using custom post types though knowledge of these is not required to use it. The question form and tables showing lists of questions asked is can be created using shortcodes.

Users can ask a question from a form placed on a page on your site. The question will then be added to the site and will be displayed as a post (using a custom post type). Users can answer the question using the comment form.

The plugin also provides some optional basic features to provide user profile pages (which the user can edit from the fontend) which include a table of the number of questions, answers and best answers the user has given. Additionally a login/register form (though the this form is still under development) is provided. You can use the plugin to replace all links for registered commenter's to their profile page.

The display of the questions and user profiles can be customised using your theme. By default questions will be displayed using the template used for your posts allowing answering of the question using your comment form. Creating a single-question.php allows you full control of how it looks.

If you have Wordpress 3.1 or higher all the questions asked will be displayed at <oursiteurl>/question/recent and can be customised by editing archive-question.php in your theme.

**Important**

 There is no guarantee that this plugin works or is secure nor that I will update it or provide support for it.

**Features:**

* ask question form short code
* list question short code
* email admin when question is asked capability
* custom email to author of question when question is answered
* display of questions can be customised by theme
* back end question moderation
* dashboard widget showing last 5 questions
* user profiles including a tables with the number of questions, answers and best answers they have provided.
* best answers

**Localisation**

I have been provided with *some* localisation of the core features for the *frontend* by Yuriy Petrovskiy. If you are fluent in another language please get in touch through the options pages of the plugin if you have translated the plugin.

Current translations are:

* Portuguese by Tristan Petersen (http://www.marketingeseo.com )
* Russian by Yuriy Petrovskiy
* Spanish by Gabriel Gil (http://gabrielgil.es)
* French by Romain Varnier (http://www.revibrevet.com)
* Turkish by sakirkoc
* Dutch by Rene (http://wpwebshop.com)
* Persian by Najeekurd
== Installation ==

1.	Extract the zip file and just drop the contents in the wp-content/plugins/ directory of your WordPress installation and then activate the Plugin from Plugins page.
2.	View the Q&A Forum page under settings in the wordpress admin to choose settings
3.	Create a normal wordpress page with the  shortcode [question_form width=\'x\' bordercolor=\'x\' style=\'x\']question form title[/question_form] to insert the question form where each of the parameters can be omitted (the style parameter is any addition css styles to add to the form)
4.	use the [list_questions] short code to list questions which can be filtered by category or user. Use the parameter author=’%’ to display the current user.
5.	If you wish the users to be logged in to ask a question select the appropriate option on the options page. It is recommended you use another plugin to manage your users (such as login with ajax and customise your community). You will also need to ensure that anyone can register in the general settings for wordpress.
6.	To customise the look of your forum create a single-question.php and quser.php if you are using user profiles file in your themes folder. This can be created in the same way as the single.php file (you could copy this if your license allows). In this forum the questions are actually posts and the answers comments so you should change the output accordingly, eg if you comment form as the text submit comment change it to submit answer.

== Frequently Asked Questions ==

**How do insert an ask question form**

Use the shortcode [question_form] in any page or post.  
This takes parameters width, bordercolor (written as you would write it in css) and style (which contains any styles to be added to the form written in css). Any text written between [question\_form] and the optional tag [/question\_form] will be displayed as a title for the form. 

eg) [question\_form width=\'98%\' bordercolor=\'#000000\' style=\'color: #999999;\']Ask a Question[/question\_form]

**How to insert (filtered) lists of questions**

This can be done by adding the shortcode [list\_questions].  
This takes the optional parameters 

*   questions : the number of questions to be displayed (default is 5)
*   author : this is either an author or % to indicate the user that is logged in. It will display only questions by that author if used.
*   category_name : the name of a category. Will only display questions in that category if used
*   border-color : color of border and background on title
*   title-color: coolor to be used for title (as css color)
*   style: any additional css styles to apply to the list