//
// Created by ME on 25.03.2019.
//

#ifndef PROJECT_IOBJECTDRAWER_H
#define PROJECT_IOBJECTDRAWER_H

#include "IAttrContainer.h"
#include "ICatalogue.h"
#include "Spatial.h"

enum {
    idDrawText, idDrawSymbol, idSymbolFillArea, idColourFillArea, idDrawSimpleLine, idDrawComplexlLine
};

struct SymbolParam {
    int symbol_name;
    double offset_x, offset_y;
};

struct TextParam {
    const char *text, *font;
    int r, g, b, transparency;
    int size, weight, slant;
    double x, y;
};

struct SymbolFillAreaParam {
    int symbol;
    double x1, y1;
    double x2, y2;
};

struct ColourFillAreaParam {
    int r, g, b, transparency;
};

struct SimpleLineParam {
    double width;
    int r, g, b;
    double interval, start, length;
};

struct ComplexlLineParam {
    double width;
    int r, g, b;
    double interval, offset;
    const double *dashes;
    int num_dashes_x2;
    const int *symbols;
    const double *symbols_position;
    int num_symb;
    const double *symbol_offset;
};

struct S101ObjectDrawerParam {
    SymbolParam m_SymbolParam;
    TextParam m_TextParam;
    SimpleLineParam m_SimpleLineParam;
    ColourFillAreaParam m_ColourFillAreaParam;
    SymbolFillAreaParam m_SymbolFillAreaParam;
    ComplexlLineParam m_ComplexlLineParam;

    S101ObjectDrawerParam() = default;
};

class IContext {
public:

    virtual bool IsSymbolizedAreas() const = 0;

    virtual bool IsSimplifiedPoints() const = 0;

    virtual bool GetFourShades() const = 0;

    virtual double GetShallowContour() const = 0;

    virtual bool GetShallowPattern() const = 0;

    virtual double GetSafetyContour() const = 0;

    virtual double GetDeepContour() const = 0;

    virtual double GetSafetyDepth() const = 0;

    virtual bool CheckViewingGroup(int group) const = 0;

    virtual ~IContext() = default;
};

class IObjectDrawer {
public:
    virtual const IContext &GetContext() const = 0;

    virtual const IFeature &GetFeature(int index_feature) const = 0;

    virtual const Spatial &GetSpatial(int id_spatial) const = 0;

    virtual int GetFeatureCount() const = 0;

    virtual const Catalogue &GetCatalogue() const = 0;

    virtual void AddFunction(int drawing_priority, int viewing_group, S101ObjectDrawerParam &param, int operation,
                             int index_feature) = 0;

    virtual ~IObjectDrawer() = default;
};

#endif //PROJECT_IOBJECTDRAWER_H
