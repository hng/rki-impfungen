---
# Feel free to add content and custom Front Matter to this file.

layout: home
---
{% for data in site.data.impfquoten_latest.data %}
{% if data[0] == 'Gesamt' %}
<div class="w-10 mt-5">
<p class="text-5xl text-purple-500">
{{ data[1].first | thousands_separated:"."}}
</p>
<p class="text-right text-gray-500">Gesamt</p>
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
          <th class="{% if forloop.first == true %}text-left{% else %}text-right{% endif %}">
           {{ header }}
          </th>
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
          <td class="py-2 text-right">
            {{ number | round: 1 | thousands_separated: "."}}
          </td>
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
