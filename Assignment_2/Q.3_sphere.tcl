
proc sphereVolume {radius} {
    set pi 3.141592653589793
    set volume [expr {(4.0/3.0) * $pi * pow($radius, 3)}]
    return $volume
}

puts "Enter the radius of the sphere:"
flush stdout
gets stdin radius


if {![string is double -strict $radius] || $radius <= 0} {
    puts "Invalid radius. Please enter a positive number."
} else {
    # Call the function and display the volume
    set volume [sphereVolume $radius]
    puts "The volume of the sphere with radius $radius is $volume."
}
