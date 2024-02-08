using System;

namespace NbaManagement.Mvvm.DependencyInjection
{
    public static class ServiceProviderExtensions
    {
        public static T GetRequiredService<T>(this IServiceProvider serviceProvider) =>
            (T)serviceProvider.GetRequiredService(typeof(T));
        
        public static object GetRequiredService(this IServiceProvider serviceProvider, Type serviceType)
        {
            var service = serviceProvider.GetService(serviceType);
            if (service is null)
                throw new InvalidOperationException("The requested service type was not registered.");

            return service;
        }
        
        public static T GetService<T>(this IServiceProvider serviceProvider) =>
            (T)serviceProvider.GetService(typeof(T));
    }
}