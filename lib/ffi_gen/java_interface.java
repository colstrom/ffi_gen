@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@interface NativeName {
    String value();
}

class NativeNameAnnotationFunctionMapper implements FunctionMapper {
    @Override
    public String mapFunctionName(String functionName, Context context) {
        for (Annotation ann : context.getAnnotations()) {
            if (ann.annotationType() == NativeName.class)
                return ((NativeName) ann).value();
        }
        return functionName;
    }
}

