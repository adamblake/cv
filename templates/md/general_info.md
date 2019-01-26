# $name.first$ $name.middle_initial$ $name.last$

<a href="mailto:$email$"><i class="fas fa-at"></i> $email$</a>

<a href="https://www.github.com/$social.github$"><i class="fab fa-github"></i> GitHub</a>
 
<a href="https://www.twitter.com/$social.twitter$"><i class="fab fa-twitter"></i> Twitter</a>
  
<a href="https://www.linkedin.com/in/$social.linkedin$"><i class="fab fa-linkedin"></i> LinkedIn</a>

<a href="https://scholar.google.com/citations?user=$social.google_scholar$"><i class="fab fa-twitter"></i> Google Scholar</a>

$address.line1$  
$address.line2$  
$address.city$, $address.state$  $address.zip$

# Research Interests

$for(research_interests)$
## $research_interests.topic$
$research_interests.details$

$endfor$

# Education

$for(education)$
$education.year$  
$education.degree$ in $education.major$  
$if(education.minor)$
Minor in $education.minor$  
$endif$
$education.school$  
$education.details$

$endfor$

# Publications
