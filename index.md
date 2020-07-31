---
title: Adam Blake
---

# Research Interests
{% for interest in site.data.cv.research_interests %}

## {{ interest.topic }}

{{ interest.details }}

{% endfor %}



# Education
{% for ed in site.data.cv.education %}

{% include card_education.html
  year=ed.year
  degree=ed.degree
  major=ed.major
  minor=ed.minor
  school=ed.school
  details=ed.details
%}

{% endfor %}



# Publications

## Professional Publications

<div class="references">
  {% capture my_include %}{% include_relative publications/articles.md %}{% endcapture %}
  {{ my_include | markdownify }}
</div>


## Software

<div class="references">
  {% capture my_include %}{% include_relative publications/software.md %}{% endcapture %}
  {{ my_include | markdownify }}
</div>


## Chapters and Entries in Edited Books

<div class="references">
  {% capture my_include %}{% include_relative publications/chapters.md %}{% endcapture %}
  {{ my_include | markdownify }}
</div>

## Manuscripts in Preparation

<div class="references">
{% capture my_include %}{% include_relative publications/in-prep.md %}{% endcapture %}
{{ my_include | markdownify }}
</div>


## Published and Refereed Conference Abstracts

<div class="references">
{% capture my_include %}{% include_relative publications/posters.md %}{% endcapture %}
{{ my_include | markdownify }}
</div>



# Grants

{% for item in site.data.cv.grants %}

{% capture title %}
  {{ item.title }} | <em>{{ item.value }}</em>
{% endcapture %}

{% include card.html
  margin=item.dates
  title=title
  details=item.location
  more_details=item.details
%}

{% endfor %}



# Research History

{% for item in site.data.cv.research %}
{% include card.html
  margin=item.dates
  title=item.title
  subtitle=item.item
  details=item.location
  more_details=item.advisor
  even_more_details=item.details
%}
{% endfor %}



# Mentorships

{% for item in site.data.cv.mentorship %}
{% include card.html
  margin=item.dates
  title=item.name
  subtitle=item.item
  details=item.location
  more_details=item.details
%}
{% endfor %}



# Teaching History

## Lecturer

{% for position in site.data.cv.teaching %}
{% include card.html
  margin=position.dates
  title=position.course
  details=position.location
  more_details=position.details
%}
{% endfor %}

## Graduate Teaching Assistant

### University of California, Los Angeles

{% for position in site.data.cv.teaching_assisting %}
{% include card.html
  title=position.course
  details=position.dates
  more_details=position.details
%}
{% endfor %}



# Honors and Awards

{% for location in site.data.cv.awards %}
{% for item in location.items %}

{% capture title %}
  {% include link_or_text.html
    link=item.link
    text=item.item
  %}
{% endcapture %}

{% include card.html
  margin=item.dates
  title=title
  subtitle=item.details
  details=location.location
  more_details=item.value
%}

{% endfor %}
{% endfor %}



# Service

{% for item in site.data.cv.service %}

{% capture subtitle %}
  {% include link_or_text.html
    link=item.link
    text=item.item
  %}
{% endcapture %}

{% include card.html
  margin=item.dates
  title=item.title
  subtitle=subtitle
  details=item.location
  more_details=item.details
%}

{% endfor %}



# Additional Proficiencies

{% for qualification in site.data.cv.qualifications %}
{{ qualification.level }} &nbsp;&nbsp; {{ qualification.name }} <br>
{% endfor %}
