#ifndef ChooseRule_h__
#define ChooseRule_h__

#ifdef _MSC_VER
#ifdef S101RULESPARSER_EXPORTS
#define S101RULES_API __declspec(dllexport)
#else
#define S101RULES_API __declspec(dllimport)
#endif
#else
#if defined( __GNUC__ ) && (__GNUC__ >= 4)
#define S101RULES_API __attribute__ ((visibility ("default")))
#else
#define S101RULES_API
#endif // __GNUC__ >= 4
#endif

#include "S100RulesParser/private/ClassCodes.h"
#include "IObjectDrawer.h"

/// \brief Применяет правила рисования для объекта с заданным идентификатором класса.
/// формата S100 по идентификатору класса объекта.
/// \param object_drawer класс для рисования карт S100.
/// \param class_id идентификатор класса объекта.
/// \param index_feature индекс feature adapters в карте.
extern "C" S101RULES_API void ChooseRule(IObjectDrawer *object_drawer, int class_id, int index_feature);
#endif