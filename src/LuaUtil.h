//
// Created by ME on 11.06.2019.
//

#ifndef DYNAMIC_LUAUTIL_H
#define DYNAMIC_LUAUTIL_H

#include "lua/lua.hpp"

[[noreturn]] void lua_err(lua_State *l, const char *message);

void addLuaPath(lua_State *L, const char *path);

void addLuaCFunction(lua_State *state, lua_CFunction func, const char *name);

int doStringPrintErr(lua_State *state, const char *string, bool print_error = true);

void runPortrayalMainTimes(lua_State *L, int times = 1);

#endif //DYNAMIC_LUAUTIL_H
