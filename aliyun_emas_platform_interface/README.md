# aliyun_emas_platform_interface

A common platform interface for the `aliyun_emas` plugin.

This interface allows platform-specific implementations of the `aliyun_emas` plugin, as well as the plugin itself, to ensure they are supporting the same interface.

# Usage

To implement a new platform-specific implementation of `aliyun_emas`, extend `AliyunEmasPlatform` with an implementation that performs the platform-specific behavior.

