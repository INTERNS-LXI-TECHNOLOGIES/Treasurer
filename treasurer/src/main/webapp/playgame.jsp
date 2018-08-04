<!DOCTYPE HTML>
<html>
	<head>
		<title>Playgame</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/game.css" />
	</head>
	<body>
	
	
	<%@ page import= "com.lxisoft.treasurer.model.*,com.lxisoft.treasurer.controller.*"%>

  <%@ page import="java.util.*"%>
	<%
	Game game=(Game)session.getAttribute("game");
	
	int count = (Integer)session.getAttribute("count");
       
	   if(count<=12)
	   {

	 		GamePageModel gamePage=new GamePageModel();
	 		int chance = (Integer)session.getAttribute("chance");
			if(count==0){
			if(chance==2){
				Collections.shuffle(game.getQuestions());
			}

				
			}
			gamePage.setQuestion(game.getQuestions().get(count));
			
			
			gamePage.setOptions(game.getOptions());
			Collections.shuffle(gamePage.getOptions());
			session.setAttribute("gamePage",gamePage);
			
			
			
			%>
			
			
	
	
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<span class="avatar"><img src="images/chest/chest.gif" alt="" /></span>
						
						
						<!-- Enter the question inside h1 tag -->
						<h1 id="question"><strong><%out.println(gamePage.getQuestion().getQuestion() );%></strong></h1>
						<!-- Enter the question inside h1 tag -->
						<br />
					</header>

				<!-- Main -->
					<section id="main">

						<!-- Thumbnails -->
							<%for(int i=0;i<gamePage.getOptions().size();i++){
								%>
								
								
								<%
								if(i%6==0){%>
								
								<div class="row"><%}%>
										<div class="column">
										<form action="game" method="post"><input type="hidden" name="choice" value="<%=gamePage.getOptions().get(i).getOption()%>">
										<input type="image" src="images/chest/closed.png" alt="submit" onmouseover="this.src='images/chest/<%=gamePage.getOptions().get(i).getImagePath()%>'" onmouseout="this.src='images/chest/closed.png'" style="width:100%"  />
										</form>
										
									
									</div><%if(i%6==5){%></div>
										
							<%}%>
							<%}%>
									
									
								
							</section>

					

				
			</div>
	   <%}%>
</div><!--code for floating lives start-->
		<i class="float">
	
<div class="my-float"><img src="images/chest/float.gif" width="140%" height="140%"></div>
</i>
<div class="label-container">
<div class="label-text">Lives left <%out.println(""+(Integer)session.getAttribute("chance"));%></div>
<i class="fa fa-play label-arrow"></i>

</div>
<!--code for floating lives end-->
	   
	</body>
	

</html>