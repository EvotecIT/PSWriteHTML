# DataTables Column Highlighter

A reusable JavaScript library for highlighting specific columns in DataTables responsive child rows based on configurable conditions.

## Usage

### 1. Include the library
```html
<script src="datatables-column-highlighter.js"></script>
```

### 2. Configure highlighting rules

```javascript
const highlightConfig = [
    {
        condition: { anyColumn: true, value: '1Password' },
        targets: [
            {
                column: 'Company',
                backgroundColor: '#fa8072',
                textColor: '#000000'
            },
            {
                column: 'Product',
                backgroundColor: '#87ceeb',
                textColor: '#000000'
            }
        ]
    }
];
```

### 3. Initialize after creating your DataTable

```javascript
// Create your DataTable
var table = $('#myTable').DataTable({
    // your DataTable configuration
});

// Setup column highlighting
setupColumnHighlighting('myTable', highlightConfig, table);
```

## Configuration Options

### Condition Types

#### Any Column Match
```javascript
condition: { anyColumn: true, value: 'SearchValue' }
```
Matches if any column in the row contains the specified value.

#### Specific Column Match
```javascript
condition: { column: 0, value: 'SearchValue' }
```
Matches if the specified column index contains the value.

#### No Condition (Always Apply)
```javascript
condition: null
```
Always applies the styling (useful for global styling).

### Target Options

#### Basic Styling
```javascript
{
    column: 'Company',           // Column name to target
    backgroundColor: '#fa8072',   // Background color
    textColor: '#000000'         // Text color
}
```

#### Advanced Styling
```javascript
{
    column: 'Company',
    backgroundColor: '#fa8072',
    textColor: '#ffffff',
    css: {                       // Custom CSS properties
        'font-weight': 'bold',
        'border': '2px solid #000'
    },
    highlightParent: true        // Also highlight parent element
}
```

## Examples

### Example 1: Single Row, Multiple Columns
```javascript
const config = [
    {
        condition: { anyColumn: true, value: '1Password' },
        targets: [
            { column: 'Company', backgroundColor: '#fa8072' },
            { column: 'Product', backgroundColor: '#87ceeb' },
            { column: 'Description', backgroundColor: '#98fb98' }
        ]
    }
];
```

### Example 2: Multiple Conditions
```javascript
const config = [
    {
        condition: { anyColumn: true, value: '1Password' },
        targets: [
            { column: 'Company', backgroundColor: '#fa8072' }
        ]
    },
    {
        condition: { anyColumn: true, value: 'Chrome' },
        targets: [
            { column: 'Company', backgroundColor: '#4285f4', textColor: '#ffffff' }
        ]
    }
];
```

### Example 3: Global Highlighting
```javascript
const config = [
    {
        condition: null, // Always apply
        targets: [
            { column: 'CPU', backgroundColor: '#fffacd' },
            { column: 'Memory', backgroundColor: '#f0f8ff' }
        ]
    }
];
```

### Example 4: Column Index Based
```javascript
const config = [
    {
        condition: { column: 0, value: 'SpecificProcess' }, // First column
        targets: [
            { column: 'Status', backgroundColor: '#90ee90' }
        ]
    }
];
```

## Advanced Usage

### Custom CSS
```javascript
{
    column: 'Priority',
    css: {
        'background': 'linear-gradient(45deg, #ff6b6b, #ee5a52)',
        'color': 'white',
        'font-weight': 'bold',
        'border-radius': '4px',
        'padding': '4px 8px'
    }
}
```

### Conditional Styling Based on Values
You can create multiple configurations for different scenarios:

```javascript
const config = [
    {
        condition: { column: 2, value: 'High' }, // Priority column
        targets: [
            { column: 'Status', backgroundColor: '#ff4444', textColor: '#ffffff' }
        ]
    },
    {
        condition: { column: 2, value: 'Medium' },
        targets: [
            { column: 'Status', backgroundColor: '#ffaa00', textColor: '#000000' }
        ]
    },
    {
        condition: { column: 2, value: 'Low' },
        targets: [
            { column: 'Status', backgroundColor: '#44ff44', textColor: '#000000' }
        ]
    }
];
```

## Minimal Setup Example

For a quick setup with minimal code in your table:

```javascript
// After your DataTable is created
setupColumnHighlighting('myTableId', [
    {
        condition: { anyColumn: true, value: 'TargetValue' },
        targets: { column: 'ColumnName', backgroundColor: '#color' }
    }
], table);
```