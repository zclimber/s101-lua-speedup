//
// Created by ME on 11.06.2019.
//

#include "LuaUtil.h"
#include <string>
#include <iostream>

[[noreturn]] void lua_err(lua_State *l, const char *message) {
    lua_pushstring(l, message);
    lua_error(l);
}

void addLuaPath(lua_State *L, const char *path) {
    lua_getglobal(L, "package");
    lua_getfield(L, -1, "path"); // get field "path" from table at top of stack (-1)
    std::string cur_path = lua_tostring(L, -1); // grab path string from top of stack
    cur_path = std::string(path) + ";" + cur_path;
    lua_pop(L, 1); // get rid of the string on the stack we just pushed on line 5
    lua_pushstring(L, cur_path.c_str()); // push the new one
    lua_setfield(L, -2, "path"); // set the field "path" in table at -2 with value at top of stack
    lua_pop(L, 1); // get rid of package table from top of stack
}

void addLuaCFunction(lua_State *state, lua_CFunction func, const char *name) {
    lua_pushcfunction(state, func);
    lua_setglobal(state, name);
}

int doStringPrintErr(lua_State *state, const char *string, bool print_error) {
    int res = luaL_loadstring(state, string);
    if (res != 0) {
        if (print_error) {
            std::cerr << lua_tostring(state, -1) << "\n";
        }
        return res;
    }
    res = lua_pcall(state, 0, 0, 0);
    if (res != 0) {
        if (print_error) {
            std::cerr << lua_tostring(state, -1) << "\n";
        }
        return res;
    }
    return 0;
}
