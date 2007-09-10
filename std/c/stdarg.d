
/*
 * Placed in public domain.
 * Written by Hauke Duden and Walter Bright
 */

module std.c.stdarg;

alias void* va_list;

template va_start(T)
{
    void va_start(out va_list ap, inout T parmn)
    {
	ap = cast(va_list)(cast(void*)&parmn + ((T.sizeof + int.sizeof - 1) & ~(int.sizeof - 1)));
    }
}

template va_arg(T)
{
    T va_arg(inout va_list ap)
    {
	T arg = *cast(T*)ap;
	ap = cast(va_list)(cast(void*)ap + ((T.sizeof + int.sizeof - 1) & ~(int.sizeof - 1)));
	return arg;
    }
}

void va_end(va_list ap)
{
}
