# Initialize the main window
package require Tk
wm title . "List Box Copy and Remove"

# Create two list boxes and scrollbar
listbox .lb1 -selectmode single
listbox .lb2 -selectmode single
scrollbar .scroll1 -command ".lb1 yview"
scrollbar .scroll2 -command ".lb2 yview"

.lb1 configure -yscrollcommand ".scroll1 set"
.lb2 configure -yscrollcommand ".scroll2 set"

# Populate the first list box with some sample items
foreach item {Item1 Item2 Item3 Item4 Item5} {
    .lb1 insert end $item
}

# Define a procedure to copy item from lb1 to lb2
proc copy_item {} {
    set selection [.lb1 curselection]
    if {$selection ne ""} {
        set item [.lb1 get $selection]
        .lb2 insert end $item
    }
}

# Define a procedure to remove item from lb2
proc remove_item {} {
    set selection [.lb2 curselection]
    if {$selection ne ""} {
        .lb2 delete $selection
    }
}

# Bind actions to list box events
bind .lb1 <<ListboxSelect>> {copy_item}
bind .lb2 <<ListboxSelect>> {remove_item}

# Arrange widgets using grid layout
grid .lb1 .scroll1 -sticky ns
grid .lb2 .scroll2 -sticky ns
grid configure .scroll1 -rowspan 5 -sticky ns
grid configure .scroll2 -rowspan 5 -sticky ns
