import 'package:flutter/material.dart';

const horizontalDesktopPadding = 81.0;

class PageButton extends StatelessWidget {
  const PageButton({
    Key? key,
    required this.isEnd,
    required this.show,
    required this.onTap,
  }) : super(key: key);

  final bool isEnd;
  final bool show;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final buttonSize = 58.0;
    final padding = horizontalDesktopPadding - buttonSize / 2;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: show
          ? ExcludeSemantics(
              child: Align(
                alignment: isEnd
                    ? AlignmentDirectional.centerEnd
                    : AlignmentDirectional.centerStart,
                child: Container(
                  width: buttonSize,
                  height: buttonSize,
                  color: Colors.black.withOpacity(0.5),
                  margin: EdgeInsetsDirectional.only(
                    start: isEnd ? 0 : padding,
                    end: isEnd ? padding : 0,
                  ),
                  child: InkWell(
                    onTap: onTap,
                    child: Icon(
                      isEnd ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
