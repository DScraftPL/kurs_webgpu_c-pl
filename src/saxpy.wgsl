@group(0)
@binding(0)
var<storage, read_write> x: array<f32>; 
@group(0)
@binding(1)
var<storage, read> y: array<f32>; 
@group(0)
@binding(2)
var<storage, read> a: f32; 

fn saxpy(x: f32, y: f32) -> f32 {
    return (a*x) + y;
}

@compute
@workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    x[global_id.x] = saxpy(x[global_id.x], y[global_id.x]);
}