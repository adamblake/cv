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
<div class="card">
  <div class="card-left">
    {{ ed.year }}
  </div>
  <div class="card-right">
    <strong>{{ ed.degree }} in {{ ed.major }}</strong>{% if ed.minor %}  <br>
    <strong>Minor in {{ ed.minor }}</strong>{% endif %}<br>
    <em>{{ ed.school }}</em><br>
    {{ ed.details }}
  </div>
</div>
{% endfor %}


# Publications

## Professional Publications

{% include articles.html %}

## Software

{% include software.html %}

## Chapters and Entries in Edited Books

{% include chapters.html %}

## Manuscripts in Preparation

{% include in-prep.html %}

## Published and Refereed Conference Abstracts

{% include posters.html %}


# Research History

{% for item in site.data.cv.research %}
<div class="card">
  <div class="card-left">
    {{ item.dates }}
  </div>
  <div class="card-right">
    <strong>{{ item.title }}</strong><br>
    <strong>{{ item.item }}</strong><br>
    {{ item.advisor }}<br>
    <em>{{ item.location }}</em>{% if item.details %}<br>
    {{ item.details }}{% endif %}
  </div>
</div>
{% endfor %}


# Mentorships

{% for item in site.data.cv.mentorship %}
<div class="card">
  <div class="card-left">
    {{ item.dates }}
  </div>
  <div class="card-right">
    <strong>{{ item.name }}</strong><br>
    <strong>{{ item.item }}</strong><br>
    <em>{{ item.location }}</em><br>
    {{ item.details }}
  </div>
</div>
{% endfor %}


# Teaching History

{% for teaching in site.data.cv.teaching %}
## {{ teaching.location }}

*{{ teaching.type }}{% if teaching.dates %} — {{ teaching.dates }}{% endif %}*

{{ teaching.details }}

{% for item in teaching.items %}
<div class="card">
  <div class="card-left">
    {{ item.code }}
  </div>
  <div class="card-right">
    <strong>{{ item.item }}</strong>{% if item.details %}<br>
    {{ item.details }}{% endif %}<br>
    <em>{{ item.dates }}</em>
  </div>
</div>

{% endfor %}
{% endfor %}


# Service

{% for item in site.data.cv.service %}
<div class="card">
  <div class="card-left">
    {{ item.dates }}
  </div>
  <div class="card-right">
    <strong>
      {{ item.title }}<br>
      {% if item.link %}
      <a href="{{ item.link }}" target="_blank">{{ item.item }}</a>
      {% else %}
      {{ item.item }}
      {% endif %}
    </strong><br>
    <em>{{ item.location }}</em>{% if item.details %}<br>
    {{ item.details }}{% endif %}
  </div>
</div>
{% endfor %}


# Honors and Awards

{% for location in site.data.cv.awards %}
## {{ location.location }}

{% for item in location.items %}
<div class="card">
  <div class="card-left">
    {{ item.dates }}
  </div>
  <div class="card-right">
    <strong>
      {% if item.link %}
      <a href="{{ item.link }}" target="_blank">{{ item.item }}</a>
      {% else %}
      {{ item.item }}
      {% endif %}
    </strong>{% if item.details or item.value %}<br>{{ item.details }} <em>{{ item.value }}</em>{% endif %}
  </div>
</div>
{% endfor %}
{% endfor %}


# Affiliations

{% for item in site.data.cv.affiliations %}
<div class="card">
  <div class="card-left">
    {{ item.dates }}
  </div>
  <div class="card-right">
    <strong>
      {% if item.link %}
      <a href="{{ item.link }}" target="_blank">{{ item.item }}</a>
      {% else %}
      {{ item.item }}
      {% endif %}
    </strong><br>
    {{ item.title }}
  </div>
</div>
{% endfor %}