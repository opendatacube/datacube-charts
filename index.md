<!-- For styles with static names... -->
<link href="{{ 'assets/css/style.css' | relative_url }}" rel="stylesheet">
<!-- For documents/pages whose URLs can change... -->
[{{ page.title }}]("{{ page.url | relative_url }}")

<h2>Latest helm packages</h2>
<ul>
{% for version_hash in site.data.versions %}
{% assign version = version_hash[1] %}

{% for entries_hash in version %}
{% assign entry = entries_hash[1] %}

{% if entry[0] == nil %}
{% else %}
  <li>
    <a href="{{ entry[0].urls[0] }}">{{ entry[0].name }}</a>
    {{ entry[0].version }}
  </li>
{% endif %}

{% endfor %}
{% endfor %}
</ul>