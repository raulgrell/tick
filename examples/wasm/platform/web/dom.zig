// https://github.com/shritesh/zig-wasm-dom
pub extern "document" fn query_selector(selector_ptr: [*]const u8, selector_len: usize) usize;
pub extern "document" fn create_element(tag_name_ptr: [*]const u8, tag_name_len: usize) usize;
pub extern "document" fn create_text_node(data_ptr: [*]const u8, data_len: usize) usize;
pub extern "element" fn set_attribute(element_id: usize, name_ptr: [*]const u8, name_len: usize, value_ptr: [*]const u8, value_len: usize) void;
pub extern "element" fn get_attribute(element_id: usize, name_ptr: [*]const u8, name_len: usize, value_ptr: *[*]u8, value_len: *usize) bool;
pub extern "event_target" fn add_event_listener(event_target_id: usize, event_ptr: [*]const u8, event_len: usize, event_id: usize) void;
pub extern "window" fn alert(msg_ptr: [*]const u8, msg_len: usize) void;
pub extern "node" fn append_child(node_id: usize, child_id: usize) usize;
pub extern "zig" fn release_object(object_id: usize) void;

const std = @import("std");

const eventId = enum(usize) {
    Submit,
    Clear,
};


pub fn querySelector(selector: []const u8) !usize {
    const node = query_selector(selector.ptr, selector.len);
    if (node == 0) return error.QuerySelectorError;
    return node;
}

pub fn createElement(name: []const u8) !usize {
    const node = create_element(name.ptr, name.len);
    if (node == 0) return error.CreateElementError;
    return node;
}

pub fn createTextNode(text: []const u8) !usize {
    const node = create_text_node(text.ptr, text.len);
    if (node == 0) return error.CreateTextNodeError;
    return node;
}

pub fn setAttribute(node: usize, attr_name: []const u8, value: []const u8) void {
    set_attribute(node, attr_name.ptr, attr_name.len, value.ptr, value.len);
}

pub fn addEventListener(node: usize, event_name: []const u8, event_id: eventId) void {
    add_event_listener(node, event_name.ptr, event_name.len, @enumToInt(event_id));
}

pub fn alert(messge: []const u8) void {
    alert(messge.ptr, messge.len);
}

pub fn appendChild(node_id: usize, child_id: usize) !usize {
    const node = append_child(node_id, child_id);
    if (node == 0) return error.AppendChildError;
    return node;
}

var input_tag_node: u32 = undefined;

fn launch() !void {
    const body_node = try querySelector("body");
    defer release_object(body_node);

    const input_tag_name = ;
    input_tag_node = try createElement("input");

    setAttribute(input_tag_node, "value","Hello from Zig!");

    const submit_button_node = try createElement("button");
    defer release_object(submit_button_node);

    addEventListener(submit_button_node, "click", eventId.Submit);

    const submit_text_node = try createTextNode("Submit");
    defer release_object(submit_text_node);

    const attached_submit_text_node = try appendChild(submit_button_node, submit_text_node);
    defer release_object(attached_submit_text_node);

    const clear_button_node = try createElement("button");
    defer release_object(clear_button_node);

    addEventListener(clear_button_node, event_name, eventId.Clear);

    const clear_text_node = try createTextNode("Clear");
    defer release_object(clear_text_node);

    const attached_clear_text_node = try appendChild(clear_button_node, clear_text_node);
    defer release_object(attached_clear_text_node);

    const attached_input_node = try appendChild(body_node, input_tag_node);
    defer release_object(attached_input_node);

    const attached_submit_button_node = try appendChild(body_node, submit_button_node);
    defer release_object(attached_submit_button_node);

    const attached_clear_button_node = try appendChild(body_node, clear_button_node);
    defer release_object(attached_clear_button_node);
}

export fn dispatchEvent(id: u32) void {
    switch (@intToEnum(eventId, id)) {
        eventId.Submit => onSubmitEvent(),
        eventId.Clear => onClearEvent(),
    }
}

fn onClearEvent() void {
    setAttribute(input_tag_node, "value","");
}

fn onSubmitEvent() !void {
    var attribute_ptr: [*]u8 = undefined;
    var attribute_len: usize = undefined;
    try get_attribute(input_tag_node,  "value", &attribute_ptr, &attribute_len);
    const result = attribute_ptr[0..attribute_len];
    defer std.heap.wasm_allocator.free(result);
    alert(result);
}

export fn launch_export() bool {
    launch() catch |err| return false;
    return true;
}

export fn _wasm_alloc(len: usize) u32 {
    var buf = std.heap.wasm_allocator.alloc(u8, len) catch |err| return 0;
    return @ptrToInt(buf.ptr);
}
