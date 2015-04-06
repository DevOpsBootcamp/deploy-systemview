# deploy-systemview-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['deploy-systemview']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### deploy-systemview::default

Include `deploy-systemview` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[deploy-systemview::default]"
  ]
}
```

## License and Authors

Author:: OSU Open Source Lab (<systems@osuosl.org>)
