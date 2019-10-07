function New-HTMLHierarchicalTree {
    param(

    )

    $Script:HTMLSchema.Features.D3Mitch = $true

    [string] $ID = "HierarchicalTree-" + (Get-RandomStringName -Size 8)


    $Section = New-HTMLTag -Tag 'section' -Attributes @{ id = $ID }

    $Script = New-HTMLTag -Tag 'script' -Value { @"
        var data = {
                "id": 1,
                "name": "Animals",
                "type": "Root",
                "description": "A living organism that feeds on organic matter",
                "children": [
                    {
                        "id": 2,
                        "name": "Carnivores",
                        "type": "Type",
                        "description": "Diet consists solely of animal materials",
                        "children": [
                            {
                                "id": 3,
                                "name": "Javanese Cat",
                                "type": "Organism",
                                "description": "Domestic breed of cats, of oriental origin",
                                "children": []
                            },
                            {
                                "id": 4,
                                "name": "Polar Bear",
                                "type": "Organism",
                                "description": "White bear native to the Arctic Circle",
                                "children": []
                            },
                            {
                                "id": 5,
                                "name": "Panda Bear",
                                "type": "Organism",
                                "description": "Spotted bear native to South Central China",
                                "children": []
                            }
                        ]
                    },
                    {
                        "id": 6,
                        "name": "Herbivores",
                        "type": "Type",
                        "description": "Diet consists solely of plant matter",
                        "children": [
                            {
                                "id": 7,
                                "name": "Angus Cattle",
                                "type": "Organism",
                                "description": "Scottish breed of black cattle",
                                "children": []
                            },
                            {
                                "id": 8,
                                "name": "Barb Horse",
                                "type": "Organism",
                                "description": "A breed of Northern African horses with high stamina and hardiness. Their generally hot temperament makes it harder to tame.",
                                "children": []
                            }
                        ]
                    }
                ]
            };


            var treePlugin = new d3.mitchTree.boxedTree()
                .setData(data)
                .setElement(document.getElementById("$ID"))
                .setIdAccessor(function(data) {
                    return data.id;
                })
                .setChildrenAccessor(function(data) {
                    return data.children;
                })
                .setBodyDisplayTextAccessor(function(data) {
                    return data.description;
                })
                .setTitleDisplayTextAccessor(function(data) {
                    return data.name;
                })
                .initialize();
"@
    } -NewLine

    $Section
    $Script
}