<?php

$books = array(	array('title' 	=> "Learning OpenCV",
					  'author'	=> "Dr. Gary Bradaski, Adrian Kaehler (Creators of OpenCV)",
					  'desc'	=> "Learning OpenCV puts you right in the middle of the rapidly expanding field of computer vision. Written by the creators of OpenCV, the widely used free open-source library, this book introduces you to computer vision and demonstrates how you can quickly build applications that enable computers to 'see' and make decisions based on the data. With this book, any developer or hobbyist can get up and running with the framework quickly, whether it's to build simple or sophisticated vision applications.",
					  'image'	=> "/wp-content/uploads/2010/07/learning-opencv-200px.jpg",
					  'amazon'	=> "http://www.amazon.com/gp/product/0596516134?ie=UTF8&tag=aish04-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0596516134",
					  'flipkart'=> "http://www.flipkart.com/learning-opencv-gary-rost-bradski-book-8184045972?affid=INUtkarNic"
					 ),
			   
			   	array('title'	=> "Digital Image Processing",
					  'author'	=> "Rafael C. Gonzalez, Richard E. Woods",
					  'desc'	=> "Completely self-contained–and heavily illustrated–this introduction to basic concepts and methodologies for digital image processing is written at a level that truly is suitable for seniors and first-year graduate students in almost any technical discipline. ",
					  'image'	=> "/wp-content/uploads/2010/07/digital-image-processing-200px.jpg",
					  'amazon'	=> "http://www.amazon.com/gp/product/013168728X?ie=UTF8&tag=aish04-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=013168728X",
					  'flipkart'=> "http://www.flipkart.com/digital-image-processing-ed-rafael-book-8131726959?affid=INUtkarNic"
					 ),
				
				array('title'	=> "Artifical Intelligence: A Modern Approach",
					  'author'	=> "Stuart Russell, Peter Norvig",
					  'desc'	=> "Artificial Intelligence: A Modern Approach introduces basic ideas in artificial intelligence from the perspective of building intelligent agents, which the authors define as 'anything that can be viewed as perceiving its environment through sensors and acting upon the environment through effectors.' This textbook is up-to-date and is organized using the latest principles of good textbook design. It covers a wide array of material, including first-order logic, game playing, knowledge representation, planning, and reinforcement learning.",
					  'image'	=> "/wp-content/uploads/2011/02/artificial-intelligence-200px.jpg",
					  'amazon'	=> "http://www.amazon.com/gp/product/0137903952?ie=UTF8&tag=aish04-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0137903952",
					  'flipkart'=> "http://www.flipkart.com/artificial-intelligence-stuart-russell-peter-book-8177583670?affid=INUtkarNic"
					 ),
				
				array('title'	=> "Digital Image Processing with Matlab",
					  'author'	=> "Rafael C. Gonzalez, Richard E. Woods, Steven L. Eddins",
					  'desc'	=> "Digital Image Processing Using MATLAB is the first book to offer a balanced treatment of image processing fundamentals and the software principles used in their implementation. The book integrates material from the leading text, Digital Image Processing by Gonzalez and Woods, and the Image Processing Toolbox from The MathWorks, Inc., a leader in scientific computing. ",
					  'image'	=> "/wp-content/uploads/2011/02/digital-image-processing-matlab-200px.jpg",
					  'amazon'	=> "http://www.amazon.com/gp/product/0982085400?ie=UTF8&tag=aish04-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0982085400",
					  'flipkart'=> "http://www.flipkart.com/digital-image-processing-using-matlab-book-8177588982?affid=INUtkarNic"
					 ),
					 
				array('title'	=> "The Kinect Sensor",
					  'author'	=> "Microsoft",
					  'desc'	=> "Kinect brings games and entertainment to life in extraordinary newways – no controller required. Easy to use and instantly fun, Kinect gets everyone off the couch moving, laughing and cheering. See a ball? Kickit. Control an HD movie with a wave of the hand. Want to join a friend in the fun? Simply jump in. With Kinect technology evaporates, letting the natural magic in all of us shine. And the best part is Kinect works with every Xbox 360 right out of the box.",
					  'image'	=> "/wp-content/uploads/2011/03/aff_kinect.jpg",
					  'amazon'	=> "http://www.amazon.com/gp/product/B002BSA298?ie=UTF8&tag=aish04-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=B002BSA298",
					  'flipkart'=> ""
					)
			  );

$rand_keys = array_rand($books, 1);
$toshow = $books[rand(0, count($books)-1)];

require("geoip.inc");

$ip = "UNKNOWN";
if(getenv("REMOTE_ADDR"))
	$ip = getenv("REMOTE_ADDR");
else if (getenv("HTTP_CLIENT_IP"))
	$ip = getenv("HTTP_CLIENT_IP");
else if(getenv("HTTP_X_FORWARDED_FOR"))
	$ip = getenv("HTTP_X_FORWARDED_FOR");

$handle = geoip_open("GeoIP.dat", GEOIP_STANDARD);
$country = geoip_country_name_by_addr($handle, $ip);
geoip_close($handle);

$useFlipkart = false;
$useFlipkart = ($country=='India')?true:false;

if($useFlipkart && $toshow['flipkart']!='')
{
	echo '<a href="'.$toshow['flipkart'].'" target="_blank"><img height="200px" src="'.$toshow['image'].'" class="frame alignleft"></a>';
	//echo '<a href="'.$toshow['flipkart'].'" target="_blank"><h2 style="margin-top:-10px;text-decoration:underline;">'.$toshow['title'].'</h2></a>';
	//echo '<p class="affauthors"><em>'.$toshow['author'].'</em></p>';
	//echo '<p>'.$toshow['desc'].'</p>';
	echo '<a class="buybutton" href="'.$toshow['flipkart'].'" target="_blank"><img src="http://static.fkcdn.com/www/444/images/buy_btn_3.png" /></a>';
	// oldhttp://static.fkcdn.com/www/326/images/buy_btn_3.png
	echo '<p class="miscinfo">Free shipping + cash on delivery in India!</p>';
}
else
{
	echo '<a href="'.$toshow['amazon'].'" target="_blank"><img height="200px" src="'.$toshow['image'].'" class="frame alignleft"></a>';
	//echo '<a href="'.$toshow['amazon'].'" target="_blank"><h2 style="margin-top:-10px;text-decoration:underline;">'.$toshow['title'].'</h2></a>';
	//echo '<p class="affauthors"><em>'.$toshow['author'].'</em></p>';
	//echo '<p>'.$toshow['desc'].'</p>';
	echo '<a class="buybutton" href="'.$toshow['amazon'].'" target="_blank"><img src="http://www.aishack.in/wp-content/uploads/2011/02/amazon-buy-now.gif" /></a>';
	echo '<p class="miscinfo">Links to Amazon.com</p>';
}


?>