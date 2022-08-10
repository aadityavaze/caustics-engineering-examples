"""
$(TYPEDEF)
"""
mutable struct Point3D
    # Coordinates
    x::Float64
    y::Float64
    z::Float64

    # Velocity at those coordinates
    ix::Int
    iy::Int
end


"""
$(SIGNATURES)
"""
function dist(p1::Point3D, p2::Point3D)
    dx = p2.x - p1.x
    dy = p2.y - p1.y
    return sqrt(dx * dx + dy * dy)
end


"""
$(SIGNATURES)

A midpoint is the average between two points
"""
midpoint(p1::Point3D, p2::Point3D) =
    Point3D(0.5p1.x + 0.5p2.x, 0.5p1.y + 0.5p2.y, 0.5p1.z + 0.5p2.z, 0, 0)


"""
$(SIGNATURES)

Barycentre of three points.
"""
centroid(p1::Point3D, p2::Point3D, p3::Point3D) = Point3D(
    (p1.x + p2.x + p3.x) / 3.0,
    (p1.y + p2.y + p3.y) / 3.0,
    (p1.z + p2.z + p3.z) / 3.0,
    0,
    0,
)


"""
$(TYPEDEF)
"""
struct Triangle
    pt1::Int64
    pt2::Int64
    pt3::Int64

    Triangle() = new(0, 0, 0)
    Triangle(pt1, pt2, pt3) = new(pt1, pt2, pt3)
end

"""
$(TYPEDEF)
"""
struct Mesh
    nodes::Vector{Point3D}
    nodeArray::Matrix{Point3D}
    triangles::Vector{Triangle}
    width::Int
    height::Int
end


"""
$(SIGNATURES)
"""
function triangle_area(mesh::Mesh, index::Int)
    triangle = mesh.triangles[index]
    pt1 = mesh.nodes[triangle.pt1]
    pt2 = mesh.nodes[triangle.pt2]
    pt3 = mesh.nodes[triangle.pt3]

    return triangle_area(pt1, pt2, pt3)
end


"""
$(SIGNATURES)
"""
function triangle_area(p1::Point3D, p2::Point3D, p3::Point3D)
    a = dist(p1, p2)
    b = dist(p2, p3)
    c = dist(p3, p1)
    s = (a + b + c) / 2.0

    return sqrt(s * (s - a) * (s - b) * (s - c))
end
