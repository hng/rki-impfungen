---
# Feel free to add content and custom Front Matter to this file.

layout: home
---
{% for data in site.data.impfquoten_latest.data %}
{% if data[0] == 'Gesamt' %}
<div class="mt-5 flex flex-col md:flex-row">
<div class="">
<p class="text-5xl text-purple-500">
{{ data[1].first | thousands_separated:"."}}
</p>
<p class="text-gray-500">Gesamt</p>
</div>
{% comment %}
<div class="mt-3 md:ml-5 md:mt-0">
<p class="text-5xl text-green-500">
+{{ data[1][1] | thousands_separated:"."}}
</p>
<p class="text-gray-500">Differenz zum Vortag</p>
</div>
{% endcomment %}
</div>
{% endif %}
{% endfor %}
  <h2 class="mt-5 text-2xl">
    {{ site.data.impfquoten_latest_date | date: "%d.%m.%Y" }}
  </h2>
{% assign day = site.data.impfquoten_latest %}

  <table class="mt-5">
    <thead>
      <tr>
        {% for header in day.headers %}
          {% if forloop.index == 1 or forloop.index == 2 %}
          <th class="{% if forloop.first == true %}text-left{% else %}text-right{% endif %}">
           {{ header }}
          </th>
          {% endif %}
        {% endfor %}
      </tr>
    </thead>
    <tbody>
      {% for data in day.data %}
        <tr class="{% if data[0] == 'Gesamt' %}font-bold border-t-2{% else %}border-b{% endif %}">
          <td class="py-2 pr-2">
            {{ data[0] }} 
          </td>
        {% for number in data[1] %}
          {% if forloop.index == 1 %}
          <td class="py-2 text-right">
            {{ number | round: 1 | replace: ".", "," | thousands_separated: "."}}
          </td>
          {% endif %}
        {% endfor %}
        </tr>
      {% endfor %}
    </tbody>
  </table>
  
  {% if day.notes.size > 0 %}
  <div class="mt-5">
      {% for note in day.notes %}
        <p class="text-sm text-gray-500">{{ note }}</p>
      {% endfor %}
  </div>
  {% endif %}
